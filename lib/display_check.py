"""Robot Framework library: enforces the workstation display configuration.

The UI tests in this suite rely on a fixed control layout that only matches
at 1920x1080 with the system display scale set to 100%. This module exposes a
single keyword used in Suite Setup that:

    1. Reads current resolution and DPI scale.
    2. Auto-adjusts both to the required values when they differ.
    3. Re-verifies, and only on failure shows an explanatory popup + aborts.

Resolution is changed via the documented `ChangeDisplaySettingsExW`. DPI scale
is changed via the *undocumented* `DisplayConfigSetDeviceInfo` device-info type
(-4 / SET_DPI_SCALE) — the same call used by community tools like SetDPI. It
works on Windows 10 1607+ and Windows 11 without sign-out, but Microsoft has
never publicly committed to it; if a future Windows release breaks the call,
the keyword still falls back to the popup so the suite fails loudly rather
than running against a wrong display config.
"""
import ctypes
from ctypes import wintypes

REQUIRED_WIDTH = 1920
REQUIRED_HEIGHT = 1080
REQUIRED_SCALE_PERCENT = 100

# Windows scale levels exposed in the Display Settings UI, in order.
_DPI_VALS = (100, 125, 150, 175, 200, 225, 250, 300, 350, 400, 450, 500)

_MB_OK = 0x00000000
_MB_ICONWARNING = 0x00000030
_MB_SYSTEMMODAL = 0x00001000
_LOGPIXELSX = 88

_ENUM_CURRENT_SETTINGS = -1
_DM_PELSWIDTH = 0x00080000
_DM_PELSHEIGHT = 0x00100000
_CDS_UPDATEREGISTRY = 0x00000001
_CDS_TEST = 0x00000002
_DISP_CHANGE_SUCCESSFUL = 0

_QDC_ONLY_ACTIVE_PATHS = 0x00000002
_DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME = 1
_DISPLAYCONFIG_DEVICE_INFO_GET_DPI_SCALE = -3
_DISPLAYCONFIG_DEVICE_INFO_SET_DPI_SCALE = -4
_DISPLAY_DEVICE_PRIMARY = 0x00000004

_original_state = None


# ─────────── ctypes structures ───────────

class _DEVMODE(ctypes.Structure):
    _fields_ = [
        ("dmDeviceName", wintypes.WCHAR * 32),
        ("dmSpecVersion", wintypes.WORD),
        ("dmDriverVersion", wintypes.WORD),
        ("dmSize", wintypes.WORD),
        ("dmDriverExtra", wintypes.WORD),
        ("dmFields", wintypes.DWORD),
        ("dmPositionX", wintypes.LONG),
        ("dmPositionY", wintypes.LONG),
        ("dmDisplayOrientation", wintypes.DWORD),
        ("dmDisplayFixedOutput", wintypes.DWORD),
        ("dmColor", wintypes.SHORT),
        ("dmDuplex", wintypes.SHORT),
        ("dmYResolution", wintypes.SHORT),
        ("dmTTOption", wintypes.SHORT),
        ("dmCollate", wintypes.SHORT),
        ("dmFormName", wintypes.WCHAR * 32),
        ("dmLogPixels", wintypes.WORD),
        ("dmBitsPerPel", wintypes.DWORD),
        ("dmPelsWidth", wintypes.DWORD),
        ("dmPelsHeight", wintypes.DWORD),
        ("dmDisplayFlags", wintypes.DWORD),
        ("dmDisplayFrequency", wintypes.DWORD),
        ("dmICMMethod", wintypes.DWORD),
        ("dmICMIntent", wintypes.DWORD),
        ("dmMediaType", wintypes.DWORD),
        ("dmDitherType", wintypes.DWORD),
        ("dmReserved1", wintypes.DWORD),
        ("dmReserved2", wintypes.DWORD),
        ("dmPanningWidth", wintypes.DWORD),
        ("dmPanningHeight", wintypes.DWORD),
    ]


class _LUID(ctypes.Structure):
    _fields_ = [("LowPart", wintypes.DWORD), ("HighPart", wintypes.LONG)]


class _DISPLAYCONFIG_PATH_SOURCE_INFO(ctypes.Structure):
    _fields_ = [
        ("adapterId", _LUID),
        ("id", wintypes.DWORD),
        ("modeInfoIdx", wintypes.DWORD),
        ("statusFlags", wintypes.DWORD),
    ]


class _DISPLAYCONFIG_RATIONAL(ctypes.Structure):
    _fields_ = [("Numerator", wintypes.DWORD), ("Denominator", wintypes.DWORD)]


class _DISPLAYCONFIG_PATH_TARGET_INFO(ctypes.Structure):
    _fields_ = [
        ("adapterId", _LUID),
        ("id", wintypes.DWORD),
        ("modeInfoIdx", wintypes.DWORD),
        ("outputTechnology", wintypes.DWORD),
        ("rotation", wintypes.DWORD),
        ("scaling", wintypes.DWORD),
        ("refreshRate", _DISPLAYCONFIG_RATIONAL),
        ("scanLineOrdering", wintypes.DWORD),
        ("targetAvailable", wintypes.BOOL),
        ("statusFlags", wintypes.DWORD),
    ]


class _DISPLAYCONFIG_PATH_INFO(ctypes.Structure):
    _fields_ = [
        ("sourceInfo", _DISPLAYCONFIG_PATH_SOURCE_INFO),
        ("targetInfo", _DISPLAYCONFIG_PATH_TARGET_INFO),
        ("flags", wintypes.DWORD),
    ]


class _DISPLAYCONFIG_MODE_INFO(ctypes.Structure):
    # Internal data is a union we don't read from — reserve enough space.
    _fields_ = [
        ("infoType", wintypes.DWORD),
        ("id", wintypes.DWORD),
        ("adapterId", _LUID),
        ("data", ctypes.c_byte * 64),
    ]


class _DPI_HEADER(ctypes.Structure):
    _fields_ = [
        ("type", ctypes.c_int32),
        ("size", wintypes.DWORD),
        ("adapterId", _LUID),
        ("id", wintypes.DWORD),
    ]


class _DPI_GET(ctypes.Structure):
    _fields_ = [
        ("header", _DPI_HEADER),
        ("minScaleRel", ctypes.c_int32),
        ("curScaleRel", ctypes.c_int32),
        ("maxScaleRel", ctypes.c_int32),
    ]


class _DPI_SET(ctypes.Structure):
    _fields_ = [
        ("header", _DPI_HEADER),
        ("scaleRel", ctypes.c_int32),
    ]


class _DISPLAYCONFIG_SOURCE_DEVICE_NAME(ctypes.Structure):
    _fields_ = [
        ("header", _DPI_HEADER),
        ("viewGdiDeviceName", wintypes.WCHAR * 32),
    ]


class _DISPLAY_DEVICE(ctypes.Structure):
    _fields_ = [
        ("cb", wintypes.DWORD),
        ("DeviceName", wintypes.WCHAR * 32),
        ("DeviceString", wintypes.WCHAR * 128),
        ("StateFlags", wintypes.DWORD),
        ("DeviceID", wintypes.WCHAR * 128),
        ("DeviceKey", wintypes.WCHAR * 128),
    ]


# ─────────── primitives ───────────

def _set_dpi_aware():
    # Without this, GetSystemMetrics returns DPI-virtualized values for
    # non-DPI-aware processes, masking a non-100% scale.
    try:
        ctypes.windll.shcore.SetProcessDpiAwareness(2)
        return
    except (AttributeError, OSError):
        pass
    try:
        ctypes.windll.user32.SetProcessDPIAware()
    except (AttributeError, OSError):
        pass


def _get_resolution():
    user32 = ctypes.windll.user32
    return user32.GetSystemMetrics(0), user32.GetSystemMetrics(1)


def _get_scale_percent():
    # Prefer the per-monitor DisplayConfig query: the system-wide DPI APIs
    # (GetDpiForSystem, GetDeviceCaps) are cached per-process at startup, so
    # they keep returning the *old* scale after we change it mid-run. The
    # DisplayConfig path always reflects the live primary-monitor value.
    primary = _primary_scale_percent_via_displayconfig()
    if primary is not None:
        return primary
    user32 = ctypes.windll.user32
    try:
        dpi = user32.GetDpiForSystem()
    except AttributeError:
        hdc = user32.GetDC(0)
        try:
            dpi = ctypes.windll.gdi32.GetDeviceCaps(hdc, _LOGPIXELSX)
        finally:
            user32.ReleaseDC(0, hdc)
    return int(round(dpi / 96 * 100))


def _primary_scale_percent_via_displayconfig():
    p = _primary_path()
    if p is None:
        return None
    info = _DPI_GET()
    info.header.type = _DISPLAYCONFIG_DEVICE_INFO_GET_DPI_SCALE
    info.header.size = ctypes.sizeof(_DPI_GET)
    info.header.adapterId = p.sourceInfo.adapterId
    info.header.id = p.sourceInfo.id
    if ctypes.windll.user32.DisplayConfigGetDeviceInfo(ctypes.byref(info)) != 0:
        return None
    idx_recommended = -info.minScaleRel
    idx_current = idx_recommended + info.curScaleRel
    if 0 <= idx_current < len(_DPI_VALS):
        return _DPI_VALS[idx_current]
    return None


def _show_popup(title, text):
    ctypes.windll.user32.MessageBoxW(
        0, text, title, _MB_OK | _MB_ICONWARNING | _MB_SYSTEMMODAL
    )


# ─────────── resolution change ───────────

def _set_resolution(width, height):
    user32 = ctypes.windll.user32
    dm = _DEVMODE()
    dm.dmSize = ctypes.sizeof(_DEVMODE)
    if not user32.EnumDisplaySettingsW(None, _ENUM_CURRENT_SETTINGS, ctypes.byref(dm)):
        return False
    if dm.dmPelsWidth == width and dm.dmPelsHeight == height:
        return True
    dm.dmPelsWidth = width
    dm.dmPelsHeight = height
    dm.dmFields = _DM_PELSWIDTH | _DM_PELSHEIGHT
    if user32.ChangeDisplaySettingsExW(None, ctypes.byref(dm), None, _CDS_TEST, None) != _DISP_CHANGE_SUCCESSFUL:
        return False
    rc = user32.ChangeDisplaySettingsExW(None, ctypes.byref(dm), None, _CDS_UPDATEREGISTRY, None)
    return rc == _DISP_CHANGE_SUCCESSFUL


# ─────────── DPI scale change (undocumented API) ───────────

def _query_active_paths():
    user32 = ctypes.windll.user32
    n_paths = wintypes.UINT(0)
    n_modes = wintypes.UINT(0)
    if user32.GetDisplayConfigBufferSizes(_QDC_ONLY_ACTIVE_PATHS,
                                          ctypes.byref(n_paths),
                                          ctypes.byref(n_modes)) != 0:
        return []
    paths = (_DISPLAYCONFIG_PATH_INFO * n_paths.value)()
    modes = (_DISPLAYCONFIG_MODE_INFO * n_modes.value)()
    if user32.QueryDisplayConfig(_QDC_ONLY_ACTIVE_PATHS,
                                 ctypes.byref(n_paths), paths,
                                 ctypes.byref(n_modes), modes,
                                 None) != 0:
        return []
    return list(paths[:n_paths.value])


def _primary_device_name():
    user32 = ctypes.windll.user32
    i = 0
    while True:
        dd = _DISPLAY_DEVICE()
        dd.cb = ctypes.sizeof(_DISPLAY_DEVICE)
        if not user32.EnumDisplayDevicesW(None, i, ctypes.byref(dd), 0):
            return None
        if dd.StateFlags & _DISPLAY_DEVICE_PRIMARY:
            return dd.DeviceName
        i += 1


def _source_gdi_name(adapter_id, source_id):
    sn = _DISPLAYCONFIG_SOURCE_DEVICE_NAME()
    sn.header.type = _DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME
    sn.header.size = ctypes.sizeof(_DISPLAYCONFIG_SOURCE_DEVICE_NAME)
    sn.header.adapterId = adapter_id
    sn.header.id = source_id
    if ctypes.windll.user32.DisplayConfigGetDeviceInfo(ctypes.byref(sn)) != 0:
        return None
    return sn.viewGdiDeviceName


def _primary_path():
    primary = _primary_device_name()
    if primary is None:
        return None
    for p in _query_active_paths():
        if _source_gdi_name(p.sourceInfo.adapterId, p.sourceInfo.id) == primary:
            return p
    return None


def _set_scale_for_source(adapter_id, source_id, target_percent):
    user32 = ctypes.windll.user32

    info = _DPI_GET()
    info.header.type = _DISPLAYCONFIG_DEVICE_INFO_GET_DPI_SCALE
    info.header.size = ctypes.sizeof(_DPI_GET)
    info.header.adapterId = adapter_id
    info.header.id = source_id
    if user32.DisplayConfigGetDeviceInfo(ctypes.byref(info)) != 0:
        return False

    # minScaleRel is the offset (in DPI step indices) from the recommended
    # scale to 100%. So index_of_recommended_in_DPI_VALS = -minScaleRel.
    idx_recommended = -info.minScaleRel
    if not (0 <= idx_recommended < len(_DPI_VALS)):
        return False
    if target_percent not in _DPI_VALS:
        return False
    idx_target = _DPI_VALS.index(target_percent)
    rel = idx_target - idx_recommended

    if rel < info.minScaleRel or rel > info.maxScaleRel:
        return False

    set_info = _DPI_SET()
    set_info.header.type = _DISPLAYCONFIG_DEVICE_INFO_SET_DPI_SCALE
    set_info.header.size = ctypes.sizeof(_DPI_SET)
    set_info.header.adapterId = adapter_id
    set_info.header.id = source_id
    set_info.scaleRel = rel
    return user32.DisplayConfigSetDeviceInfo(ctypes.byref(set_info)) == 0


def _set_scale(target_percent):
    p = _primary_path()
    if p is None:
        return False
    return _set_scale_for_source(p.sourceInfo.adapterId, p.sourceInfo.id, target_percent)


def _get_primary_scale_rel():
    """Return (adapterId.LowPart, adapterId.HighPart, source_id, curScaleRel)
    for the primary source, or None if it can't be queried."""
    p = _primary_path()
    if p is None:
        return None
    info = _DPI_GET()
    info.header.type = _DISPLAYCONFIG_DEVICE_INFO_GET_DPI_SCALE
    info.header.size = ctypes.sizeof(_DPI_GET)
    info.header.adapterId = p.sourceInfo.adapterId
    info.header.id = p.sourceInfo.id
    if ctypes.windll.user32.DisplayConfigGetDeviceInfo(ctypes.byref(info)) != 0:
        return None
    return (p.sourceInfo.adapterId.LowPart,
            p.sourceInfo.adapterId.HighPart,
            p.sourceInfo.id,
            info.curScaleRel)


def _apply_scale_rel(adapter_low, adapter_high, source_id, scale_rel):
    adapter = _LUID()
    adapter.LowPart = adapter_low
    adapter.HighPart = adapter_high
    set_info = _DPI_SET()
    set_info.header.type = _DISPLAYCONFIG_DEVICE_INFO_SET_DPI_SCALE
    set_info.header.size = ctypes.sizeof(_DPI_SET)
    set_info.header.adapterId = adapter
    set_info.header.id = source_id
    set_info.scaleRel = scale_rel
    return ctypes.windll.user32.DisplayConfigSetDeviceInfo(ctypes.byref(set_info)) == 0


# ─────────── public Robot Framework keyword ───────────

def verify_display_settings():
    """Ensure resolution=1920x1080 and scale=100%; auto-adjust if possible.

    Snapshots the original resolution + primary-monitor DPI scale before any
    change so `Restore Display Settings` (Suite Teardown) can put things back.
    On any unrecoverable mismatch shows a system-modal popup and raises an
    AssertionError so Suite Setup fails and tests are skipped.
    """
    global _original_state
    _set_dpi_aware()

    initial_w, initial_h = _get_resolution()
    initial_scale = _get_scale_percent()

    if (initial_w, initial_h) == (REQUIRED_WIDTH, REQUIRED_HEIGHT) and initial_scale == REQUIRED_SCALE_PERCENT:
        return

    _original_state = {
        "resolution": (initial_w, initial_h),
        "scale_rel": _get_primary_scale_rel(),
    }

    if (initial_w, initial_h) != (REQUIRED_WIDTH, REQUIRED_HEIGHT):
        _set_resolution(REQUIRED_WIDTH, REQUIRED_HEIGHT)
    if initial_scale != REQUIRED_SCALE_PERCENT:
        _set_scale(REQUIRED_SCALE_PERCENT)

    width, height = _get_resolution()
    scale = _get_scale_percent()
    if (width, height) == (REQUIRED_WIDTH, REQUIRED_HEIGHT) and scale == REQUIRED_SCALE_PERCENT:
        print(
            "Display auto-adjusted: {iw}x{ih} @ {is_}% -> {w}x{h} @ {s}%".format(
                iw=initial_w, ih=initial_h, is_=initial_scale,
                w=width, h=height, s=scale,
            )
        )
        return

    message = (
        "Your current display resolution is set to {w}x{h} and Scale is {s}%.\n\n"
        "Automatic adjustment to the required values failed.\n"
        "To continue with automation you need to set:\n"
        "    Display resolution : {rw}x{rh}\n"
        "    Scale              : {rs}%\n\n"
        "Please set them and restart the automation."
    ).format(
        w=width, h=height, s=scale,
        rw=REQUIRED_WIDTH, rh=REQUIRED_HEIGHT, rs=REQUIRED_SCALE_PERCENT,
    )
    _show_popup("Mindfox RT Automation - Display Check", message)
    raise AssertionError(
        "Display check failed: {w}x{h} @ {s}% (required {rw}x{rh} @ {rs}%); auto-adjust did not take effect."
        .format(
            w=width, h=height, s=scale,
            rw=REQUIRED_WIDTH, rh=REQUIRED_HEIGHT, rs=REQUIRED_SCALE_PERCENT,
        )
    )


def restore_display_settings():
    """Restore the resolution and DPI scale captured by Verify Display Settings.

    No-op if the snapshot is empty (e.g., the workstation already matched the
    required values, or the suite is being run twice in one process).
    """
    global _original_state
    if not _original_state:
        return
    snapshot = _original_state
    _original_state = None  # consume so a re-run doesn't double-apply

    w, h = snapshot["resolution"]
    if (w, h) != (REQUIRED_WIDTH, REQUIRED_HEIGHT):
        _set_resolution(w, h)

    sr = snapshot.get("scale_rel")
    if sr is not None:
        adapter_low, adapter_high, source_id, scale_rel = sr
        _apply_scale_rel(adapter_low, adapter_high, source_id, scale_rel)

    width, height = _get_resolution()
    scale = _get_scale_percent()
    print("Display restored to: {w}x{h} @ {s}%".format(w=width, h=height, s=scale))

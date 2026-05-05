"""Robot Framework library: pre-checks the workstation display configuration.

The UI tests in this suite rely on a fixed control layout that only matches
at 1920x1080 with the system display scale set to 100%. This module exposes a
single keyword used in Suite Setup to fail fast (with an explanatory popup) if
the workstation is configured otherwise.
"""
import ctypes

REQUIRED_WIDTH = 1920
REQUIRED_HEIGHT = 1080
REQUIRED_SCALE_PERCENT = 100

_MB_OK = 0x00000000
_MB_ICONWARNING = 0x00000030
_MB_SYSTEMMODAL = 0x00001000
_LOGPIXELSX = 88


def _set_dpi_aware():
    # Without this, GetSystemMetrics returns DPI-virtualized values for
    # non-DPI-aware processes, which would mask a non-100% scale.
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


def _show_popup(title, text):
    ctypes.windll.user32.MessageBoxW(
        0, text, title, _MB_OK | _MB_ICONWARNING | _MB_SYSTEMMODAL
    )


def verify_display_settings():
    """Fail (with popup) unless the workstation is at 1920x1080 @ 100% scale."""
    _set_dpi_aware()
    width, height = _get_resolution()
    scale = _get_scale_percent()

    if (width, height) == (REQUIRED_WIDTH, REQUIRED_HEIGHT) and scale == REQUIRED_SCALE_PERCENT:
        return

    message = (
        "Your current display resolution is set to {w}x{h} and Scale is {s}%.\n\n"
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
        "Display check failed: {w}x{h} @ {s}% (required {rw}x{rh} @ {rs}%). "
        "Set Windows display resolution to {rw}x{rh} and scale to {rs}%, then re-run."
        .format(
            w=width, h=height, s=scale,
            rw=REQUIRED_WIDTH, rh=REQUIRED_HEIGHT, rs=REQUIRED_SCALE_PERCENT,
        )
    )

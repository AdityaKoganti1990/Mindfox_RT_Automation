"""Robot Framework variable file: resolves the installed app path & version automatically.

Resolution order for the FoxViewerDesktop executable:
  1. The path Robot hands in (it resolves %{FOXRT_APP_PATH=<default>} first).
  2. Ask Windows Installer where the exe is (lib/find_foxrt_exe.ps1) - authoritative
     and instant, works wherever the MSI installed it regardless of drive.
  3. Probe common install folders on every drive (covers dev/non-MSI builds).
  4. As a last resort, do a bounded recursive scan of each drive.

Once located, the path is cached into the FOXRT_APP_PATH user environment variable
(via setx) so subsequent runs resolve instantly without searching. This keeps the
suite working on any machine no matter which drive FoxRT is installed on, with no
manual configuration.

It also reads the FileVersion property of the executable so ${APPLICATION_VERSION}
stays in sync with whatever build is installed locally.

Usage in a .resource / .robot file:
    *** Settings ***
    Variables    ../lib/app_version.py    %{FOXRT_APP_PATH=C:\\Program Files\\MindFox Software Solutions\\FoxRT Pro\\FoxViewerDesktop.exe}

Optional explicit override (skips discovery):
    Variables    ../lib/app_version.py    D:\\custom\\FoxViewerDesktop.exe
"""
import os
import string
import subprocess

ENV_VAR_NAME = "FOXRT_APP_PATH"
EXE_NAME = "FoxViewerDesktop.exe"
# The install tree below the root is stable; only the base folder varies per machine.
APP_RELATIVE_PATH = os.path.join("MindFox Software Solutions", "FoxRT Pro", EXE_NAME)
DEFAULT_APP_PATH = os.path.join(r"C:\Program Files", APP_RELATIVE_PATH)

_FINDER_SCRIPT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "find_foxrt_exe.ps1")

# Base folders to probe under each drive root before falling back to a deep scan.
_COMMON_BASES = (
    "Program Files", "Program Files (x86)", "Applications", "Apps",
    "Work", "Tools", "Dev", "",
)
# Folders that never hold the app and are slow/irrelevant to walk.
_SKIP_DIRS = {
    "Windows", "$Recycle.Bin", "System Volume Information", "ProgramData",
    "AppData", "node_modules", ".git", ".venv", "Temp", "Recovery",
}
_MAX_SCAN_DEPTH = 5


def _drives():
    return [f"{d}:\\" for d in string.ascii_uppercase if os.path.exists(f"{d}:\\")]


def _find_via_installer():
    """Ask Windows Installer for the exe path. Authoritative & instant for MSI installs."""
    if not os.path.isfile(_FINDER_SCRIPT):
        return None
    try:
        completed = subprocess.run(
            [
                "powershell", "-NoProfile", "-NonInteractive",
                "-ExecutionPolicy", "Bypass", "-File", _FINDER_SCRIPT,
            ],
            capture_output=True, text=True, check=False, timeout=60,
        )
    except Exception:
        return None
    path = completed.stdout.strip()
    return path if path and os.path.isfile(path) else None


def _probe_common_locations():
    """Fast: check <drive>\\<base>\\MindFox Software Solutions\\FoxRT Pro\\<exe>."""
    for drive in _drives():
        for base in _COMMON_BASES:
            candidate = os.path.join(drive, base, APP_RELATIVE_PATH)
            if os.path.isfile(candidate):
                return candidate
    return None


def _deep_scan():
    """Last resort: walk each drive (depth-capped, system folders pruned)."""
    for drive in _drives():
        for root, dirs, files in os.walk(drive, onerror=lambda _e: None):
            dirs[:] = [d for d in dirs if d not in _SKIP_DIRS]
            if EXE_NAME in files:
                return os.path.join(root, EXE_NAME)
            if root[len(drive):].count(os.sep) >= _MAX_SCAN_DEPTH:
                dirs[:] = []  # stop descending past the depth cap
    return None


def _persist(path):
    """Cache the resolved path so future runs skip discovery. Best-effort only."""
    try:
        subprocess.run(
            ["setx", ENV_VAR_NAME, path],
            capture_output=True, text=True, check=False,
        )
    except Exception:
        pass  # Caching is an optimisation; never fail a run over it.


def _resolve_exe(exe_path):
    """Return (resolved_path, was_discovered). Raises if the exe cannot be found."""
    if exe_path and os.path.isfile(exe_path):
        return exe_path, False
    found = _find_via_installer() or _probe_common_locations() or _deep_scan()
    if found:
        return found, True
    raise FileNotFoundError(
        f"Could not locate {EXE_NAME}. Checked '{exe_path}', Windows Installer, common "
        f"install folders on every drive, and a depth-{_MAX_SCAN_DEPTH} scan. Install "
        f"FoxRT or set {ENV_VAR_NAME} to the full path of {EXE_NAME}."
    )


def _read_file_version(exe_path):
    completed = subprocess.run(
        [
            "powershell",
            "-NoProfile",
            "-NonInteractive",
            "-Command",
            f"(Get-Item -LiteralPath '{exe_path}').VersionInfo.FileVersion",
        ],
        capture_output=True,
        text=True,
        check=True,
    )
    return completed.stdout.strip()


def get_variables(exe_path=DEFAULT_APP_PATH):
    exe_path, discovered = _resolve_exe(exe_path)
    if discovered:
        _persist(exe_path)
    version = _read_file_version(exe_path)
    if not version:
        raise RuntimeError(f"FileVersion is empty for {exe_path}")
    return {
        "APP_PATH": exe_path,
        "APPLICATION_VERSION": f"Version {version}",
        "APPLICATION_VERSION_in_loginscreen": f"VERSION {version}",
    }

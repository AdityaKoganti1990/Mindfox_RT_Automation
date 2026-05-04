"""Robot Framework variable file: resolves the installed app version automatically.

Reads the FileVersion property of the FoxViewerDesktop executable so the test
suite stays in sync with whatever build is installed locally. Removes the need
to hand-edit ${APPLICATION_VERSION} after every build upgrade.

Usage in a .resource / .robot file:
    *** Settings ***
    Variables    ../lib/app_version.py

Optional override (e.g. running against a non-default install path):
    Variables    ../lib/app_version.py    D:\\custom\\FoxViewerDesktop.exe
"""
import os
import subprocess

DEFAULT_APP_PATH = r"C:\Program Files\MindFox Software Solutions\FoxRT Pro\FoxViewerDesktop.exe"


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
    if not os.path.isfile(exe_path):
        raise FileNotFoundError(
            f"Cannot resolve APPLICATION_VERSION: executable not found at {exe_path}"
        )
    version = _read_file_version(exe_path)
    if not version:
        raise RuntimeError(f"FileVersion is empty for {exe_path}")
    return {
        "APP_PATH": exe_path,
        "APPLICATION_VERSION": f"Version {version}",
        "APPLICATION_VERSION_in_loginscreen": f"VERSION {version}",
    }

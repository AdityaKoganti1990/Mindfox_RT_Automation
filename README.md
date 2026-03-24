# ScanViewX RobotFramework Test Suite

This project contains a RobotFramework test suite for automating the ScanViewX application using the FlaUI Library for Windows UI automation.

## Prerequisites
- Python 3.8+
- RobotFramework
- FlaUILibrary
- .NET Desktop Runtime (required by FlaUI)

## Setup
1. Install dependencies:
   ```powershell
   pip install robotframework
   pip install robotframework-flaUILibrary
   ```
   Or install all required packages for this project:
   ```powershell
   pip install -r requirements.txt
   ```

2. Install pythonnet notes:
   - On Windows, use the same Python bitness as your .NET runtime (64-bit Python for 64-bit .NET).
   - Install pythonnet with:
     ```powershell
     pip install pythonnet
     ```
   - If you encounter issues, see pythonnet docs: https://github.com/pythonnet/pythonnet
2. Ensure the ScanViewX application is available at the path specified in the test suite (`tests/scanviewx_suite.robot`).
3. Update `${APP_PATH}` in the test suite if needed.

## Running Tests
Run the following command from the project root:
```powershell
robot tests/scanviewx_suite.robot
```

Quick dry-run (verifies imports and keywords without executing test steps):
```powershell
robot --dryrun tests/scanviewx_suite.robot
```

**IronPython Integration**

- **Why / When**: Some .NET libraries are easier to host from IronPython (for example to avoid pythonnet compatibility issues). This project includes an IronPython XML-RPC server (`lib/ironpy_remote_server.py`) that loads `GlobalLibrary.dll` and exposes a small set of methods (e.g. `control_click`, `save_control_image`) which Robot can call via the XML-RPC client `lib/ironpy_remote_client.py`.

- **Install IronPython (Windows, example using winget)**:
   ```powershell
   winget install --id Microsoft.IronPython.3 -e --accept-package-agreements --accept-source-agreements
   ```
   Or download the installer from the IronLanguages GitHub releases: https://github.com/IronLanguages/ironpython3/releases

- **Verify installation**:
   ```powershell
   & 'C:\Program Files\IronPython 3.4\ipy.exe' -V
   ```

- **Start the IronPython XML-RPC server** (run before Robot tests):
   ```powershell
   & 'C:\Program Files\IronPython 3.4\ipy.exe' lib\ironpy_remote_server.py
   ```
   The server listens on port `8270` by default and will print startup logs including any assembly load errors.

- **Use from Robot**: the project provides wrappers and resource keywords:
   - `lib/ironpy_remote_client.py` — Robot library with: `Set_IronPy_Server_Url` and `Control_Click_IronPy` keywords.
   - `resources/scanviewx_keywords.resource` contains `Click Tools Menu Using IronPythonRemote` which calls the IronPython server.
   Example usage (in a test):
   ```robotframework
   Click Tools Menu Using IronPythonRemote    ScanView 2.0    My Window Title    rbPage_Tools    True
   ```

- **Troubleshooting**:
   - Ensure `lib/dotnet/GlobalLibrary.dll` and its dependent DLLs (e.g. `UIAComWrapperX.dll`) are present in `lib/dotnet`.
   - If a dependent native DLL is blocked by Windows, right-click -> Properties -> Unblock, or run PowerShell `Get-ChildItem lib\dotnet\*.dll | Unblock-File`.
   - Confirm IronPython bitness matches any native dependencies (64-bit vs 32-bit).

- **Alternative**: you can also host `GlobalLibrary.dll` inside a .NET service (see `lib/dotnet_service`) and call it via HTTP; this is useful for running automation on remote machines where Robot remains on the controller machine.


## AutoIt Integration

- **Why / When**: AutoIt can be useful for Windows GUI interactions that are difficult to automate via UIA or when you need low-level input control. This project can use `robotframework-autoitlibrary` to call AutoIt functions from Robot tests.

- **Install AutoIt runtime (Windows)**:
   1. Download and install AutoIt from: https://www.autoitscript.com/site/autoit/downloads/
   2. Verify installation (example):
       ```powershell
       "C:\Program Files (x86)\AutoIt3\AutoIt3.exe" /version
       ```

- **Install the Robot AutoIt library** (on the controller/test runner machine):
   ```powershell
   pip install robotframework-autoitlibrary
   ```
   Or, if you use `requirements.txt`:
   ```powershell
   pip install -r requirements.txt
   ```

- **Notes**:
   - Ensure AutoIt and Python bitness are compatible if you use any native bridges.
   - The `robotframework-autoitlibrary` package provides Robot keywords such as `Run AutoIt Script`, `Control Click`, and `Win Wait`.
   - I added `robotframework-autoitlibrary` to this project's `requirements.txt`.

## Project Structure
- `tests/scanviewx_suite.robot` - Main RobotFramework test suite
- `.github/copilot-instructions.md` - Copilot custom instructions

## Notes
- FlaUILibrary requires the .NET Desktop Runtime to be installed on your system.
- For more information, see the [FlaUILibrary documentation](https://github.com/MarketSquare/robotframework-flaui).

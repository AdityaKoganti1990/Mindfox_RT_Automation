# Locate FoxViewerDesktop.exe on this machine and print its full path (nothing if not found).
# Discovery order (fast & authoritative first):
#   1. App Paths registry  - canonical "where is this exe", instant.
#   2. Windows Installer    - MSI component path; works wherever the MSI installed it, any drive.
# The MSI product code is read from the Uninstall registry (by display name) so this keeps
# working across builds even though the product code changes each version.
# Used by lib/app_version.py so the suite finds the app on any machine/drive with no setup.
$ErrorActionPreference = 'SilentlyContinue'
$exeName = 'FoxViewerDesktop.exe'

# 1) App Paths (registered by some installers) -------------------------------
foreach ($hive in @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\$exeName",
        "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\$exeName")) {
    $p = (Get-ItemProperty -LiteralPath $hive).'(default)'
    if ($p -and (Test-Path -LiteralPath $p)) { Write-Output $p; exit 0 }
}

# 2) Windows Installer (MSI) component path ----------------------------------
# Collect candidate MSI product codes from the Uninstall registry by display name.
$uninstallRoots = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall',
    'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall')
$codes = @()
foreach ($root in $uninstallRoots) {
    Get-ChildItem $root | ForEach-Object {
        $dn = (Get-ItemProperty $_.PSPath).DisplayName
        if (($dn -match 'Fox' -or $dn -match 'MindFox') -and $_.PSChildName -match '^\{[0-9A-Fa-f\-]+\}$') {
            $codes += $_.PSChildName
        }
    }
}
$codes = $codes | Select-Object -Unique

# Single-quoted SQL so the backtick-quoted identifiers reach MSI verbatim.
$sql = 'SELECT `Component`.`ComponentId`, `File`.`FileName` FROM `Component`,`File` WHERE `File`.`Component_` = `Component`.`Component`'
try {
    $installer = New-Object -ComObject WindowsInstaller.Installer
    foreach ($product in $codes) {
        $local = $installer.ProductInfo($product, 'LocalPackage')
        if (-not $local -or -not (Test-Path -LiteralPath $local)) { continue }
        $db = $installer.OpenDatabase($local, 0)
        $view = $db.OpenView($sql)
        $view.Execute()
        while ($rec = $view.Fetch()) {
            if ($rec.StringData(2) -match 'FoxViewerDesktop\.exe') {
                $path = $installer.ComponentPath($product, $rec.StringData(1))
                if ($path -and (Test-Path -LiteralPath $path)) { Write-Output $path; exit 0 }
            }
        }
    }
} catch { }

exit 1

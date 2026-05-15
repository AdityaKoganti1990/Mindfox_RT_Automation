param(
    [Parameter(Mandatory=$true)][string]$VersionText,
    [int]$TimeoutSeconds = 30
)

$wshell = New-Object -ComObject WScript.Shell
$message = "Detected Application Version:`n`n$VersionText`n`nClick OK to continue, or Cancel to STOP the automation.`n(Auto-continues in $TimeoutSeconds seconds if no response.)"
$title   = "Mindfox RT Automation - App Version"
$buttons = 1 + 64 + 4096

$result = $wshell.Popup($message, $TimeoutSeconds, $title, $buttons)

if ($result -eq 2) {
    Write-Host "User clicked Cancel. Stopping automation."
    exit 2
} elseif ($result -eq -1) {
    Write-Host "Popup timed out after $TimeoutSeconds seconds. Continuing."
    exit 0
} else {
    Write-Host "User clicked OK. Continuing."
    exit 0
}

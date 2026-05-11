$wshell = New-Object -ComObject WScript.Shell

$message = "Automation completed.`n`nShutdown PC in 60 seconds?`n`n(No response in 30 minutes will proceed with shutdown.)"
$title   = "Mindfox RT Automation"
$timeout = 1800
$buttons = 4 + 32 + 4096

$result = $wshell.Popup($message, $timeout, $title, $buttons)

if ($result -eq 7) {
    Write-Host "Shutdown cancelled by user."
    exit 1
} else {
    if ($result -eq -1) {
        Write-Host "No response in 30 minutes. Proceeding with shutdown."
    } else {
        Write-Host "User confirmed shutdown."
    }
    Write-Host "Initiating shutdown in 60 seconds. Run 'shutdown /a' to cancel."
    & shutdown /s /t 60
    exit 0
}

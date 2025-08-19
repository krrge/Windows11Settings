Remove-Item -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Recurse -Confirm:$false -Force
Write-Host Restarting explorer.exe ...
$process = Get-Process -Name "explorer"
Stop-Process -InputObject $process
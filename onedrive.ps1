icacls $Env:OneDrive /deny "Administrators:(D,DC)"
Start-Process 'C:\Windows\System32\OneDriveSetup.exe' -ArgumentList '/uninstall' -Wait
Stop-Process -Name FileCoAuth,Explorer -Force
Remove-Item "$Env:LocalAppData\Microsoft\OneDrive" -Recurse -Force
Remove-Item "C:\ProgramData\Microsoft OneDrive" -Recurse -Force
icacls $Env:OneDrive /grant "Administrators:(D,DC)"
Set-Service -Name OneSyncSvc -StartupType Disabled
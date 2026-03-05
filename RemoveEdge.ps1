$EdgePath = (Get-AppxPackage -Name "Microsoft.MicrosoftEdge.Stable").InstallLocation
if ($EdgePath) {
    Write-Host "Uninstalling Edge via Appx..."
    Get-AppxPackage -Name "Microsoft.MicrosoftEdge.Stable" | Remove-AppxPackage
}
$ProgramFilesEdge = "${env:ProgramFiles(x86)}\Microsoft\Edge"
if (Test-Path $ProgramFilesEdge) {
    Write-Host "Removing Edge files from Program Files (x86)..."
    Remove-Item -Path $ProgramFilesEdge -Recurse -Force
}
$EdgeUpdatePath = "${env:ProgramFiles(x86)}\Microsoft\EdgeUpdate"
if (Test-Path $EdgeUpdatePath) {
    Remove-Item -Path $EdgeUpdatePath -Recurse -Force
}
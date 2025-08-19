if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

$registryChanges = @(
    @{
        Path = "HKLM:\SOFTWARE\Policies\Microsoft\EdgeUpdate"
        Name = "CreateDesktopShortcutDefault"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "EdgeEnhanceImagesEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "PersonalizationReportingEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "ShowRecommendationsEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "HideFirstRunExperience"
        Type = "DWord"
        Value = "1"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "UserFeedbackAllowed"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "ConfigureDoNotTrack"
        Type = "DWord"
        Value = "1"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "AlternateErrorPagesEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "EdgeCollectionsEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "EdgeFollowEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "EdgeShoppingAssistantEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "MicrosoftEdgeInsiderPromotionEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "ShowMicrosoftRewards"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "WebWidgetAllowed"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "DiagnosticData"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "EdgeAssetDeliveryServiceEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "CryptoWalletEnabled"
        Type = "DWord"
        Value = "0"
    },
    @{
        Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge"
        Name = "WalletDonationEnabled"
        Type = "DWord"
        Value = "0"
    }
)

foreach ($change in $registryChanges) {
    $regPath = $change.Path
    $regName = $change.Name
    $regType = $change.Type
    $regValue = $change.Value

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "Created registry key: $regPath" -ForegroundColor Green
    }

    try {
        Set-ItemProperty -Path $regPath -Name $regName -Type $regType -Value $regValue -Force
        Write-Host "Successfully set registry value: $regName = $regValue" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to set registry value: $regName. Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

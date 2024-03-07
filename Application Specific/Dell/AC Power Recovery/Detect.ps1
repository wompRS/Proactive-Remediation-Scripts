### Fill in these values ###
$dell_bios_path = "DellSmbios:\PowerManagement\AcPwrRcvry"
$dell_bios_value = "Last"
###

try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    Import-Module DellBIOSProvider
    $detect_regentry = get-item -path $dell_bios_path

    switch ($detect_regentry.CurrentValue) {
        "Last" {Write-Host "Success"; exit 0}
        "On" {Write-Host "Success"; exit 0}
        "Off" {Write-Host "Disabled"; exit 1}
        $NULL {Write-Host "Option Unavailable"; exit 0}
        Default {Write-Host "Unknown"; exit 1}
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

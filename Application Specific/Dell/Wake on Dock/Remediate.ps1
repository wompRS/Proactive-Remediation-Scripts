### Fill in these values ###
$dell_bios_path = "DellSmbios:\PowerManagement\WakeOnDock"
$dell_bios_value = "Enabled"
$dell_bios_bad_value = "Disabled"
###

try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    Import-Module DellBIOSProvider
    set-item -Path $dell_bios_path $dell_bios_value
    $detect_regentry = get-item -path $dell_bios_path
        
    switch ($detect_regentry.CurrentValue) {
        $dell_bios_value {Write-Host "Success"}
        $dell_bios_bad_value {Write-Host "Disabled"}
        $NULL {Write-Host "Option Unavailable"}
        Default {Write-Host "Unknown"}
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

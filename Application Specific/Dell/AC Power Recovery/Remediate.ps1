### Fill in these values ###
$dell_bios_path = "DellSmbios:\PowerManagement\AcPwrRcvry"
$dell_bios_value = "Last"
###

try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    Import-Module DellBIOSProvider
    set-item -Path $dell_bios_path $dell_bios_value
    $detect_regentry = get-item -path $dell_bios_path
        
    if ($detect_regentry.CurrentValue -eq $dell_bios_value){
        #Exit 0 for Intune if NO error
        Write-Host "Successful!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "NOT successful!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

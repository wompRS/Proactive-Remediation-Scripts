try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Import-Module DellBIOSProvider
    set-item -Path DellSmbios:\PowerManagement\AutoOn "Everyday"
    Set-Item -Path DellSmbios:\PowerManagement\AutoOnHr "21"
    Set-Item -Path DellSmbios:\PowerManagement\AutoOnMn "00"
    $autoon = get-item -path DellSmbios:\PowerManagement\autoon
    $autoonhr = get-Item -Path DellSmbios:\PowerManagement\AutoOnHr
    $autoonmn = get-Item -Path DellSmbios:\PowerManagement\AutoOnMn
        
    if ($autoon.CurrentValue -eq 'Everyday' -AND $autoonhr.CurrentValue -eq 21 -AND $autoonmn.CurrentValue -eq 00){
        #Exit 0 for Intune if NO error
        Write-Host "Successfully set Auto-on to everyday, 9PM!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Failed to set Auto-on!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Import-Module DellBIOSProvider
    $autoon = get-item -path DellSmbios:\PowerManagement\autoon
    $autoonhr = get-Item -Path DellSmbios:\PowerManagement\AutoOnHr
    $autoonmn = get-Item -Path DellSmbios:\PowerManagement\AutoOnMn
        
    if ($autoon.CurrentValue -eq 'Everyday' -AND $autoonhr.CurrentValue -eq 21 -AND $autoonmn.CurrentValue -eq 00){
        #Exit 0 for Intune if NO error
        Write-Host "Auto-on already set to everyday, 9PM!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Auto-on NOT set to everyday, 9PM!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
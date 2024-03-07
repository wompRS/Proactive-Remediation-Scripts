try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    Import-Module DellBIOSProvider
    $setting = get-item -path DellSmbios:\TpmSecurity\TpmActivation
        
    if ($setting.CurrentValue -eq "Enabled"){
        #Exit 0 for Intune if NO error
        Write-Host "TPM activation already enabled!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "TPM activation NOT already enabled!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
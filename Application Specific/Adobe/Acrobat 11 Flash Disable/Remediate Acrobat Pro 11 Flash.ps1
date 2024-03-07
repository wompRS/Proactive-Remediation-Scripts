### Fill out these values required for detecting the registry key value
$reg_path = "HKLM\SOFTWARE\Policies\Adobe\Adobe Acrobat\11.0\FeatureLockDown" # Enter the Registry key path.
$reg_key = "bEnableFlash" # Enter the Registry key dword name.
$reg_value = 0 # Enter the desired value to REMEDIATE the vulnerability.
$reg_type = "DWORD" # Do not change unless the Value is not a DWORD

try {
    New-ItemProperty -Path Registry::$reg_path -Name $reg_key -PropertyType $reg_type -Value $reg_value -Force
    $regentry = Get-ItemProperty -Path Registry::$reg_path -Name $reg_key
        
    if ($regentry.$reg_key -eq 0){
        #Exit 0 for Intune if NO error
        Write-Host "Setting is disabled and remediation is successful. Exiting."
        exit 0
    }
    ElseIf ($regentry.$reg_key -eq $null){        
        #Exit 1 for Intune if error
        Write-Host "Registry Key does not exist! Exiting."
        exit 0}
    else {
        #Exit 1 for Intune if error
        Write-Host "Setting is not disabled. Running again!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

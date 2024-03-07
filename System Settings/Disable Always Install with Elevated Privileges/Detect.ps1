### Fill out these values required for detecting the registry key value
$reg_path = "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" # Enter the Registry key path.
$reg_key = "AlwaysInstallElevated" # Enter the Registry key dword name.
$reg_value = 0 # Enter the desired value to REMEDIATE the vulnerability.

try {
    $regentry = Get-ItemProperty -Path Registry::$reg_path -Name $reg_key
        
    if ($regentry.$reg_key -eq $reg_value){
        #Exit 0 for Intune if NO error
        Write-Host "Setting is disabled! Exiting."
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

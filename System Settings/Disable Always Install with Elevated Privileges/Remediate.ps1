### Fill out these values required for detecting the registry key value
$reg_path = "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" # Enter the Registry key path.
$reg_key = "AlwaysInstallElevated" # Enter the Registry key dword name.
$reg_value = 0 # Enter the desired value to REMEDIATE the vulnerability.
$reg_type = "DWORD" # Do not change unless the Value is not a DWORD

try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    New-Item -Path Registry::$reg_path
    New-ItemProperty -Path Registry::$reg_path -Name $reg_key -PropertyType $reg_type -Value $reg_value -Force
    $regentry = Get-ItemProperty -Path Registry::$reg_path -Name $reg_key
        
    if ($regentry.$reg_key -eq $reg_value){
        #Exit 0 for Intune if NO error
        Write-Host "Setting is Enabled! Exiting."
        exit 0
    }
    ElseIf ($null -eq $regentry.$reg_key){        
        #Exit 1 for Intune if error
        Write-Host "Registry Key exists. Exiting."
        exit 0}
    else {
        #Exit 1 for Intune if error
        Write-Host "Setting is not enabled. Running again!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

# Define the registry key values to detect and remediate
$reg_path = "" # Enter the Registry key path.
$reg_key = "" # Enter the Registry key dword name.
$reg_value = 1 # Enter the desired value to remediate the vulnerability.
$reg_type = "DWORD" # Do not change unless the value is not a DWORD

try {
    # Create or update the registry key value
    New-ItemProperty -Path "Registry::$reg_path" -Name $reg_key -PropertyType $reg_type -Value $reg_value -Force
    $regentry = Get-ItemProperty -Path "Registry::$reg_path" -Name $reg_key
        
    if ($regentry.$reg_key -eq $reg_value) {
        # Exit with code 0 if the setting is disabled
        Write-Host "Setting is disabled! Exiting."
        exit 0
    }
    ElseIf ($null -eq $regentry.$reg_key) {        
        # Exit with code 1 if the registry key does not exist
        Write-Host "Registry key does not exist! Exiting."
        exit 1
    }
    else {
        # Exit with code 1 if the setting is not disabled
        Write-Host "Setting is not disabled. Running again!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

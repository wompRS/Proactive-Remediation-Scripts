# Define the registry key path, key name, and desired value for remediation
$reg_path = "" # Enter the Registry key path.
$reg_key = "" # Enter the Registry key dword name.
$reg_value = 1 # Enter the desired value to remediate the vulnerability.

try {
    $regentry = Get-ItemProperty -Path "Registry::$reg_path" -Name $reg_key
        
    if ($regentry.$reg_key -eq $reg_value) {
        # Exit with code 0 if the setting is already disabled
        Write-Host "Setting is already disabled. Exiting."
        exit 0
    }
    elseif ($null -eq $regentry.$reg_key) {        
        # Exit with code 1 if the registry key does not exist
        Write-Host "Registry key does not exist. Exiting."
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
    Write-Host "An error occurred: $errMsg"
    exit 1
}

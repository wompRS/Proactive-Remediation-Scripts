### Fill out these values required for detecting the registry key value
$reg_path = "HKEY_CLASSES_ROOT\ms-msdt" # Enter the Registry key path.
try {
    $regentry = Get-ItemProperty -Path Registry::$reg_path
        
    if ($regentry) {
        #Exit 0 for Intune if NO error
        Write-Host "Setting is disabled! Exiting."
        exit 1
    }
    ElseIf ($regentry -eq $null) {        
        #Exit 1 for Intune if error
        Write-Host "Registry Key does not exist! Exiting."
        exit 0
    }
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


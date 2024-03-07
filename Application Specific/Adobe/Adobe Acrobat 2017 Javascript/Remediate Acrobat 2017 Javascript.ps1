### Fill out these values required for detecting the registry key value
$reg_path = "HKLM\SOFTWARE\Policies\Adobe\Acrobat\2017\FeatureLockDown" # Enter the Registry key path. Remove <>.
$reg_key = "bDisableJavaScript" # Enter the Registry key dword name. Remove <>
$reg_value = 1 # Enter the desired value to REMEDIATE the vulnerability.
$reg_type = "DWORD" # Do not change unless the Value is not a DWORD


try {
    New-ItemProperty -Path Registry::$reg_path -Name $reg_key -PropertyType $reg_type -Value $reg_value -Force
    $detect_regentry = Get-ItemProperty -Path Registry::$reg_path -Name $reg_key
    
    if (! (Test-Path $reg_path)) {Write-Host "Registry Path does not exist."; exit 0}
    switch ($detect_regentry.$reg_key) {
        $reg_value { Write-Host "Registry Key is set correctly."; exit 0 }
        Default { Write-Host "Registry Key is incorrect. Proceed with Remediation"; exit 1 }
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

### Fill in these values ###
$reg_path = "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer"
$reg_key = "AlwaysInstallElevated"
$reg_value = 0
###

try {
    $detect_regentry = Get-ItemProperty -Path Registry::$reg_path -Name $reg_key
        
    switch ($detect_regentry.$reg_key) {
        $reg_value {Write-Host "Success"; exit 0}
        Default {Write-Host "Unknown"; exit 1}
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
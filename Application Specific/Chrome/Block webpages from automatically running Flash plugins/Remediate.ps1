### Fill in these values ###
$reg_path = "HKLM\SOFTWARE\Policies\Google\Chrome"
$reg_key = "DefaultPluginsSetting"
$reg_type = "DWORD"
$reg_value = 3
###

try {
    New-ItemProperty -Path Registry::$reg_path -Name $reg_key -PropertyType $reg_type -Value $reg_value -Force
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

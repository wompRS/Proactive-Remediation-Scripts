### Fill in these values ###
$reg_path = "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings"
$reg_key = "Enabled"
$reg_type = "DWORD"
$reg_value = 0
###

try {
    New-ItemProperty -Path Registry::$reg_path -Name $reg_key -PropertyType $reg_type -Value $reg_value -Force
    $detect_regentry = Get-ItemProperty -Path Registry::$reg_path -Name $reg_key
        
    switch ($detect_regentry.$reg_key) {
        $reg_value {Write-Host "Success"; exit 0}
        $NULL {Write-Host "Option Unavailable"; exit 1}
        Default {Write-Host "Failed"; exit 1}
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

### Fill in these values ###
$reg_path = "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"
$reg_key = "SecurityLayer"
$reg_value = 2
###

try {
    $detect_regentry = Get-ItemProperty -Path Registry::$reg_path -Name $reg_key

    switch ($detect_regentry.$reg_key) {
        $reg_value {Write-Host "Success"; exit 0}
        $NULL {Write-Host "Not set"; exit 0}
        Default {Write-Host "Bad value:" $detect_regentry.$reg_key; exit 1}
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

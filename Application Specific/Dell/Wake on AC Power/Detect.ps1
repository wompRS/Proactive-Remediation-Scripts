try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    Import-Module DellBIOSProvider
    $wakeonac = get-item -path DellSmbios:\PowerManagement\WakeOnAc

    switch ($wakeonac.CurrentValue) {
        "Enabled" {Write-Host "Success"; exit 0}
        "Disabled" {Write-Host "Disabled"; exit 1}
        $NULL {Write-Host "Option Unavailable"; exit 0}
        Default {Write-Host "Unknown"; exit 1}
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
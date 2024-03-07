try {
    New-ItemProperty -Path Registry::"HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableIPSourceRouting" -PropertyType "DWORD" -Value "2" -Force
    $regentry = Get-ItemProperty -Path Registry::"HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableIPSourceRouting"
        
    if ($regentry.DisableIPSourceRouting -eq 2){
        #Exit 0 for Intune if NO error
        Write-Host "Setting was disabled!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Setting was NOT disabled!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

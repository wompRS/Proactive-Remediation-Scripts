try {
    Set-MpPreference -DisableRealtimeMonitoring $false
    $computerstatus = Get-MpComputerStatus
        
    if ($computerstatus.RealTimeProtectionEnabled -eq $True){
        #Exit 0 for Intune if NO error
        Write-Host "Successfully enabled real-time protection!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Failed enabling real-time protection!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
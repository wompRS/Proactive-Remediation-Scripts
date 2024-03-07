try {
    $computerstatus = Get-MpComputerStatus
        
    if ($computerstatus.RealTimeProtectionEnabled -eq $True){
        #Exit 0 for Intune if NO error
        Write-Host "Real-time protection status is enabled!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Real-time protection status is NOT enabled!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
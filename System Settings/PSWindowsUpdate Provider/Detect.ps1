try {        
    if (Get-InstalledModule -Name "PSWindowsUpdate"){
        #Exit 0 for Intune if NO error
        Write-Host "PSWindowsUpdate already installed!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "PSWindowsUpdate is NOT installed!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Install-Module -Name DellBIOSProvider -MinimumVersion 2.4.0 -SkipPublisherCheck -Force -AllowClobber
    
    if (Get-InstalledModule -Name "DellBIOSProvider"){
        #Exit 0 for Intune if NO error
        Write-Host "DellBIOSProvider module installed successfully!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Failed to install DellBIOSProvider module!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
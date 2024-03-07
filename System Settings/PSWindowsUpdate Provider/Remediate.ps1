try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Set-PSRepository -Name "psgallery" -InstallationPolicy Trusted
    Register-PSRepository -Default
    Install-Module -Name PSWindowsUpdate -SkipPublisherCheck -Force -AllowClobber
    
    if (Get-InstalledModule -Name "PSWindowsUpdate"){
        #Exit 0 for Intune if NO error
        Write-Host "PSWindowsUpdate module installed successfully!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Failed to install PSWindowsUpdate module!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
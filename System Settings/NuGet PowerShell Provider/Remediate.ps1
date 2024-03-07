try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    
    if (Get-PackageProvider -Name "NuGet"){
        #Exit 0 for Intune if NO error
        Write-Host "Successfully installed NuGet provider!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Failed to install NuGet provider!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
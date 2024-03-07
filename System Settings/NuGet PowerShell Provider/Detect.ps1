try {        
    if (Get-PackageProvider -Name "NuGet"){
        #Exit 0 for Intune if NO error
        Write-Host "NuGet provider already installed!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "NuGet provider NOT already installed!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
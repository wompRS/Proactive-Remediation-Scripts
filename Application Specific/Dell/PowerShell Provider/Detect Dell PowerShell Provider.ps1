try {        
    if (Get-InstalledModule -Name "DellBIOSProvider"){
        #Exit 0 for Intune if NO error
        $version = Get-InstalledModule dellbiosprovider

        if($version.Version -ge [System.Version]"2.4.0") {
            # Exit 0 for InTune: Installed and updated
            Write-Host "DellBIOSProvider already installed, updated!"
            exit 0
        }
        else {
            # Exit 1 for InTune: Needs updated
            Write-Host "DellBIOSProvider needs updating!"
            exit 1
        }
        
    }
    else {
        # Exit 1 for Intune: Not installed
        Write-Host "DellBIOSProvider is NOT installed!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
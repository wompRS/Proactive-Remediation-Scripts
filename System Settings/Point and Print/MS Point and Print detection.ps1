try {
    $regentry = Get-ItemProperty -Path Registry::"HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name "RestrictDriverInstallationToAdministrators"
        

    if ($regentry.RestrictDriverInstallationToAdministrators -eq 1){
        #Exit 0 for Intune if NO error
        Write-Host "Setting is Enabled!"
        exit 1
    }
    ElseIf ($null -eq $regentry.RestrictDriverInstallationToAdministrators ){        
        #Exit 1 for Intune if error
        Write-Host "Registry Key does not exist!"
        exit 1}
    else {
        #Exit 1 for Intune if error
        Write-Host "Setting is NOT disabled!"
        exit 0
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}


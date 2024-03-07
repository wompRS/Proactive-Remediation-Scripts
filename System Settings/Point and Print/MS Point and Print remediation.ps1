try {
    New-ItemProperty -Path Registry::"HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name "RestrictDriverInstallationToAdministrators" -PropertyType "DWORD" -Value "0" -Force
    $regentry = Get-ItemProperty -Path Registry::"HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name "RestrictDriverInstallationToAdministrators"
        
    if ($regentry.RestrictDriverInstallationToAdministrators -eq 0){
        #Exit 0 for Intune if NO error
        Write-Host "Setting was disabled!"
        exit 0
    }
    ElseIf ($null -eq $regentry.RestrictDriverInstallationToAdministrators){        
        #Exit 1 for Intune if error
        Write-Host "Registry Key does not exist!"
        exit 1}
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

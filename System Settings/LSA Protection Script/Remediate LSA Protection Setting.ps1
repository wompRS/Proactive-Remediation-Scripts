try {
    New-ItemProperty -Path Registry::"HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -Name "RunAsPPL" -PropertyType "DWORD" -Value "1" -Force
    $regentry = Get-ItemProperty -Path Registry::"HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -Name "RunAsPPL"
        
    if ($regentry.RunAsPPL -eq 1){
        #Exit 0 for Intune if NO error
        Write-Host "Setting was disabled!"
        exit 0
    }
    ElseIf ($regentry.RunAsPPL -eq $null){        
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

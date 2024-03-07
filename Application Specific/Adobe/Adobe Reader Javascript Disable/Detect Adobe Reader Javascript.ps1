try {
    $readerreg = Get-ItemProperty -Path Registry::"HKLM\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" -Name "bDisableJavaScript"
        
    if ($readerreg.bDisableJavaScript -eq 1){
        #Exit 0 for Intune if NO error
        Write-Host "Adobe Reader Javascript is disabled!"
        exit 0
    }
    else {
        #Exit 1 for Intune if error
        Write-Host "Adobe Reader Javascript is NOT disabled!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

#New-ItemProperty -Path Registry::"HKLM\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" -Name "bDisableJavaScript" -PropertyType "DWORD" -Value "1" -Force 
#New-ItemProperty -Path Registry::"HKLM\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown" -Name "bDisableJavaScript" -PropertyType "DWORD" -Value "1" -Force 
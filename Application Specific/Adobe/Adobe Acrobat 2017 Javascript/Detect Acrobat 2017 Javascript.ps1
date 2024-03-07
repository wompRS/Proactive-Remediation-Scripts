try {
    $regentry = Get-ItemProperty -Path Registry::"HKLM\SOFTWARE\Policies\Adobe\Acrobat\2017\FeatureLockDown" -Name "bDisableJavaScript"
        
    if ($regentry.bDisableJavaScript -eq 1){
        #Exit 0 for Intune if NO error
        Write-Host "Setting is good!"
        exit 0
    }
    ElseIf ($regentry.bDisableJavaScript -eq $null){        
        #Exit 1 for Intune if error
        Write-Host "Registry Key does not exist!"
        exit 1}
    else {
        #Exit 1 for Intune if error
        Write-Host "Setting is NOT good!"
        exit 1
    }
}
catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

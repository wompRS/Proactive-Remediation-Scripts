Set-ExecutionPolicy -scope Process Unrestricted
# Fill out these values required for detecting the registry key value
$reg_path = "HKLM:\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces\tcpip*" # Enter the Registry key path.
$reg_key = "NetbiosOptions" # Enter the Registry key dword name.
$reg_value = 2 # Enter the desired value to REMEDIATE the vulnerability.
$reg_type = "DWORD" # Do not change unless the Value is not a DWORD

# Array to store the outcomes of each interface entry
$results = @()
$changedEntries = @()

try {
    # Change the value of the "NetbiosOptions" registry key for each interface
    $child_items = Get-ChildItem $reg_path
    foreach ($child_item in $child_items) {
        $interface_name = $child_item.PSChildName
        $interface_path = $child_item.PSPath

        New-ItemProperty -Path $interface_path -Name $reg_key -PropertyType $reg_type -Value $reg_value -Force

        # Recheck the value of the "NetbiosOptions" registry key for the interface
        $regentry = Get-ItemProperty -Path $interface_path -Name $reg_key

        if ($regentry.$reg_key -eq $reg_value) {
            # Outcome if disabled
            $outcome = "$interface_name - Netbios is Disabled!"
            $results += $outcome
            $changedEntries += $interface_name
            Write-Host $outcome
        } elseif ($regentry.$reg_key -eq $null) {
            # Outcome if registry key does not exist
            $outcome = "$interface_name - Yousa registry key does not exist!"
            $results += $outcome
            Write-Host $outcome
        } else {
            # Outcome if not disabled
            $outcome = "$interface_name - Netbios is not disabled. Mesa running again!"
            $results += $outcome
            Write-Host $outcome
        }
    }

    # Check if any interface was not disabled or had a missing registry key
    $failed = $results -match "Netbios is not disabled|Yousa registry key does not exist"
    if ($failed) {
        # Exit 1 for Intune if any interface failed
        Write-Host "Some interfaces are not disabled or have missing registry keys. Exiting."
        exit 1
    } else {
        # Exit 0 for Intune if all interfaces passed
        Write-Host "All interfaces are disabled. Exiting. Beep Boop boooooop..."
        exit 0
    }

} catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}

# Print the outcome of each interface entry
Write-Host "Outcome of each interface entry:"
$results

# Print the changed entries
Write-Host "Changed entries:"
$changedEntries
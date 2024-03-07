Set-ExecutionPolicy -scope Process Unrestricted
# Fill out these values required for detecting the registry key value
$reg_path = "HKLM:\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces\tcpip*" # Enter the Registry key path.
$reg_key = "NetbiosOptions" # Enter the Registry key dword name.
$reg_value = 2 # Enter the desired value to REMEDIATE the vulnerability.

# Get all child items under the specified registry path
$child_items = Get-ChildItem $reg_path

# Array to store the outcomes of each interface entry
$results = @()

# Check the value of the specified registry key for each child item
foreach ($child_item in $child_items) {
    $interface_name = $child_item.PSChildName
    $regentry = Get-ItemProperty -Path $child_item.PSPath -Name $reg_key

    if ($regentry -eq $null -or $regentry.$reg_key -ne $reg_value) {
        # Outcome if disabled or registry key does not exist
        $outcome = "$interface_name - Not disabled or Registry Key does not exist."
        $results += $outcome

        Write-Host $outcome
    } else {
        # Outcome if enabled
        $outcome = "$interface_name - Netbios is Disabled"
        $results += $outcome
        Write-Host $outcome
    }
}

# Check if any interface was disabled or had a missing registry key
$failed = $results -match "Not disabled|Registry Key does not exist"
if ($failed) {
    # Exit 1 for Intune if any interface failed
    Write-Host "Some interfaces are not disabled or have missing registry keys. Exiting wiith code 1."
    exit 1
} else {
    # Exit 0 for Intune if all interfaces passed
    Write-Host "All interfaces are disabled. Exiting. Beep Boop boooooop."
    exit 0
}

# Print the outcome of each interface entry
Write-Host "Outcome of each interface entry:"
$results

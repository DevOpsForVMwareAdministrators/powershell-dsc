
# Creating MOF file
$mofpath = "\\<server>\moffiles\$vmname\"
WebServer $VMName -OutputPath $mofpath

$ScriptText = "Set-DscLocalConfigurationManager -Path $mofpath -ComputerName $VMName"

# Get the VM object from vCenter
$vm = Get-VM $VMName

# Prompt user for VM guest OS credentials
$guestcred = Get-Credential

# Invoke the script on the Guest OS
Invoke-VMscript -ScriptText $ScriptText -VM $vm -GuestCredential $guestcred -ScriptType PowerShell -Server $vcenter
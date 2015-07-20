$script = "E:\Scripts\DevOps\WebServer.psd1"
$mofpath = "C:\Users\Administrator\Documents"
$moffile = "C:\Users\Administrator\Documents\WebServer.psd1"

# The following line invokes the configuration and creates a file called Server001.meta.mof at the specified path

$guestcred = Get-Credential
$BuildMof = WebServer -OutputPath $mofpath

# Get the virtual machine object from vCenter server
$vm = Get-VM devops-02

# Copy the script to the designated directory on the target VM
Copy-VMGuestFile -Source $script -Destination $mofpath -LocalToGuest -VM $vm -HostCredential $cred -Server $vcenter -GuestCredential $guestcred

# Invoke the copied script on the target VM
Invoke-VMScript -ScriptText $moffile -VM $vm -HostCredential $cred -Server $global:DefaultVIServer -GuestCredential $guestcred
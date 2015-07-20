
###### Creating the VM #####

# The following information is required for connecting to the vCenter Server
$vcenter = "vTesseract-vc51"

# $vcenter = Read-Host 'What is your vCenter Server Name?'

# $cred = Get-Credential
<# We recommend you never put credentials in plain text.
Use the above $cred call when running the script interactively.
Specifying credentials is NOT required when the script is being run by a
user whose logged in credentials match credentials with appropriate vCenter permissions assigned.
#>

<# Collect or Define VM Info.
 In this section I have defined values.
 You can opt to collect info yourself from environment
 or user VM Info
#>

$VMName = 'devops-02'
# Read-Host 'VM Name?'

# VM Deployment Requirements
$TemplateName = "w2k12r2-01"
# Read-Host 'Template Name?'

$OSSpecName = "W2K12R2"
# Read-Host 'OS Customization Spec Name?'

$DatastoreCluster = "vTesseract-Nas01"
# Read-Host 'Datastore Cluster Name?'

$VMhostCluster = "MGMT"
# Read-Host 'Cluster Name?'

$FolderName = "Devops"
# Read-Host 'Folder Name?'

###### Script Execution Section ######

# Connect to vCenter Server
if($cred -eq $null){
  Connect-VIserver $vcenter
}else{
  Connect-VIserver $vcenter -Credential $cred
}

# Compile New VM Info
$Template = Get-Template -Name $TemplateName
$OSSpec = Get-OSCustomizationSpec $OSSpecName
$Datastore = Get-DatastoreCluster -Name $DatastoreCluster
# Datastore Cluster assumes Storage DRS is turned on for the Cluster
$Cluster = Get-Cluster -Name $VMhostCluster
$Folder = Get-Folder $FolderName

##### Creates the new VM based on collected info. #####

New-VM -Name $VMName -Template $Template -OSCustomizationSpec $OSSpec -Datastore $Datastore -ResourcePool $Cluster -Location $Folder


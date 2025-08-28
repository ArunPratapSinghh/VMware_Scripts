#####Adding Host to Vcenter########

#Command screens clear
Clear-Host

#User and Password Details
$User = "administrator@vpshere.local"
$Password = "VMware123!"

#vCenter Name
$Server_Name = ""

#User

#Connect to vcenter
$vCenter =  Connect-VIserver -Server "$Server_Name" -Port 443 -User "$User" -Password "$Password"

#List of Hosts in vCenter
$Host_list = get-VMhost -Server $Server_Name |Select Name, Version, State, PowerState

#Add Host in vCenter
$Host_Add = Set-VMHost -VMHost "$VMHost" -state "Disconnected" -RunAsSysnc -User "root" -Password "$Password"  -confirm:$false
Write-host "Host has been connected state"

#Logout from vCenter
$Disconnect_VIServer = Disconnect-VIServer -Server $Server_Name -confirm:$false

Write-Host "Script has been successfully completed ."


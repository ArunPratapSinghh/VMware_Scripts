#clear the command line
Clear-Host

#Details of User,Password and vCenter
$UserName = ""
$Password = ""
$vCenter_Name = ""


#Connect to VI Server
$Connect_vCenter =  Connect-VIServer -Server "$ServerName" -Port 443 -Username  $UserName -Password $Password

#server_Name
$Server_Name = Read-Host "Enter the server Name"

#Snapshot_Details
$Snapshot_Details = Get-Snapshot -Name $Server_Name |Select-object Name,Description |format-table -Autosize

Read-Enter "Details of Snapshot details mentioned below"
$Snapshot_Details

$Disconnect_Server = Disconnect-VIserver -Server "$ServerName"


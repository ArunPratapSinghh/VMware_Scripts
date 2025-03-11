#Connect Vi server########

#Details of User,Password and vCenter
$UserName = ""
$Password = ""
$vCenter_Name = ""

$Connect_vCenter = Connect-VIserver -Server $ServerName -Port 443 -User $UserName -password $Password
Write-Host "UserName has been connected to Vcenter:$vCenter_Name" -ForegroundColor Cyan

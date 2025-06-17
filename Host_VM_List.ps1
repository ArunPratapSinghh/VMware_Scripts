#Command clear Before running the script##########
Clear-host

#Details of User,Password and vCenter
$UserName = ""
$Password = ""
$vCenter_Name = ""
#For only one host
$Host_List = ""   

#Information for multiple host 
$Server_List = Get-content -Path C:\temp\Host_List_List.txt

#Connect vCenter
Connect-VIServer -Server $vCenter_Name -Port 443 -User $UserName -Password $Password

Foreach($Host in $Host_List)
{
      try{
      #List of All host in the vCenter
      Get-VMhost -VM $Host |select Name,Version,State, Powerstate
  }catch{

    Write-Host "Host $Host is not found in the vCenter $vCenter_Name" -ForgroundColor Yellow 

}
}
$Logoff From vCenter
$Logoff_ViServer = Disconnect-ViServer -Server $vCenter_Name -confirm:$false

Write-Host "Script has been completed" -ForgroundColor Cyan

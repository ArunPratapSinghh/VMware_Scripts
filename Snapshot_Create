#####Create Snapshot #######

#Details of User,Password and vCenter
$UserName = ""
$Password = ""
$vCenter_Name = ""
$Snapshot_Name = ""
$Snapshot_Description = ""

#List of Server which required Snapshot
$Server_List = Get-content -Path C:\temp\Snapshot_List.txt

#Connect vCenter
Connect-VIServer -Server $vCenter_Name -Port 443 -User $UserName -Password $Password

#Forloop for Creating Snapshot
foreach($VM in $Server_List)
{
  #Using try-catch method to take the snaphsot
    try{

            New-Snapshot -VM $VM -Name $Snapshot_Name -Description $Snapshot_Description -memory -RunAsync -Confirm:$false
            Write-Host "Requested Snapshot has been Created of $VM" -ForegroundColor Cyan

        }
    catch{

            Write-Host "Server is not hosted in the vCenter. Kindly check the server" -ForgroundColor Yellow
        
          }  
}

#logoff from vCenter
Disconnect-VIServer -Server $vCenter_Name -Confirm:$false
Write-Host "vCenter has logoff and Script has been completed to delete the Snapshot" -ForegroundColor Red


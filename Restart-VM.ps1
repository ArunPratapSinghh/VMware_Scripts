
##########Restart VM from the vcenter#############

##Clear Command windows
Clear-Host

#Title of script
Write-Host "Restart the VM script" -forgroundcolor Cyan

#List of Server which required Snapshot
$Server_List = Get-content -Path C:\temp\Snapshot_List.txt

#Details of User,Password and vCenter
$UserName = ""
$Password = ""
$vCenter_Name = ""

#Connect vCenter
Connect-VIServer -Server $vCenter_Name -Port 443 -User $UserName -Password $Password

#Forloop for Creating Snapshot
foreach($VM in $Server_List)
{
  #Using try-catch method to Restart the VM
    try{
            $Ping_Test = Test-Connection -ComputerName $VM -count 2 -quiet
            if($Ping_Test -imatch 'true'){
                  Write-Host "Server is pinging and we are proceeding to restart the VM" -forgroundcolor Yellow
                  Restart-VM -computerName $VM -Force -Confirm:$false
                  Start-sleep -seconds 20
                  Write-host "VM has been restarted .Please validate" -forgroundcolor Green
              }else{

                    Write-Host $VM is not pinging. Kindly check -ForgroundColor Red
              }

        }
    catch{ 

            Write-Host "Server is not hosted in the vCenter. Kindly check the server" -ForgroundColor Yellow
        
          }  
}

#logoff from vCenter
Disconnect-VIServer -Server $vCenter_Name -Confirm:$false
Write-Host "vCenter has logoff and Script has been completed to delete the Snapshot" -ForegroundColor Red



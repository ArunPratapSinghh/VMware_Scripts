#Command Screen clear Before running the script#####@@@
Clear-host

#Write-Host "Bulk VM Rename starting..." -forgroundcolor Green

#Details of User,Password and vCenter
$UserName = ""
$Password = ""
$vCenter_Name = ""
#For only VM list
$VM_List = ""   

#Information for multiple host 
$Server_List = Get-content -Path C:\VM_List_List.txt

#Connect vCenter
Connect-VIServer -Server $vCenter_Name -Port 443 -User $UserName -Password $Password

Foreach($Host in $Host_List)
{
      try{
            #Powering ON VM
            Get-VM -VM $VM |Set-VM -Name $VM"_Do_not_PowerON" -confirm:$false
      
  }catch{

    Write-Host " Server $VM is not found in the vCenter" -ForgroundColor Yellow 
  }
}
Write-Host "All VM has been Renamed" -ForgroundColor Red

$Disconnect_vcenter = Disconnect-VIServer -server $vCenter -Confirm:$false

Write-Host "Script has been completed. Kindly validate the VM" -ForgroundColor yellow

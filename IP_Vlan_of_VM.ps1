
#Command Screen clear Before running the script####
Clear-host

Write-Host "Bulk VM IP and VLAN details starting..." -forgroundcolor Green

#Details of User,Password and vCenter
$UserName = ""
$Password = ""
$vCenter_Name = ""
#For only VM list
#$VM_List = ""   

#Information for multiple host 
$Server_List = Get-content -Path C:\VM_List_List.txt

#Connect vCenter
Connect-VIServer -Server $vCenter_Name -Port 443 -User $UserName -Password $Password

Foreach($Host in $Host_List)
{
      try{
            #Vlan and IP Details
            Get-VM -VM $VM |Select-Object Name , @{Name="IPAddress";E={($_ |Get-VMGuest).IPAddress}},@{Name="VLAN";E={($_ |Get-VirtualPortgroup).Name}} |ForMat-table -Autosize
     
  }catch{

    Write-Host " Server $VM is not found in the vCenter" -ForgroundColor Yellow 
  }
}
Write-Host "All VM IPandVLAN details has been extracted." -ForgroundColor Red

$Disconnect_vcenter = Disconnect-VIServer -server $vCenter -Confirm:$false

Write-Host "Script has been completed. Kindly validate the VM" -ForgroundColor yellow

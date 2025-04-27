###Service start in VMware#####

#Connect to vCenter
$vCenter_connect = Connect-Viserver -Server $vCenter

#List of host
$list = Get-content -Path C:\temp\host_list.txt


#for loop
foreach($Host in $list)
{

      Service_Status = Get-VMhostservice -VMhost $Host |where-object {$_.key -eq 'TSM-SSH'} |Stop-VMhostservice -Confirm:$false
      Write-Host Serviice has been stopped on host" -forgroundcolor Green 
      }

Disconect-VIserver -Server $vCenter -confirm:$false

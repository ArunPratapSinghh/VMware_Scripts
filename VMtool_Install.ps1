####Install the VMtool On windows servers####

$list = get-content -Path C:\temp\Server_list.txt

foreach($Vm in $list)
{
    Invoke-command -computername $VM -scriptblock {

                    Start-Process -Filepath C:\temp\Vmtool\Vmtool.exe -Argumentlist '"/s /v \"qn Reboot=ReallySuppress\ ""' -WindowsStyle Hidden -Wait
                    Start-sleep -second 10
                    Write-Host "Patch has been installed in server $VM"

}

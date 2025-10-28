
#Script to create a VM shell build environment 

# Login on the Vcenter Server.
Connect-VIServer -Server $vcenterServer -User $username -Password $password
# Create a new VM from a template
#
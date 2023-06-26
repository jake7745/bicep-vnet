$rgExists = az group exists --name 'rg-testing'

if ($rgExists -eq $true){
    Write-Output "Deleting the resource group"
    az group delete -y -n  rg-testing
}

az group create --name rg-testing --location CentralUS

New-AzResourceGroupDeployment -Name network-deployment -resourcegroupName rg-testing -templatefile .\vNet.bicep -Templateparameterfile .\envs\stg.json

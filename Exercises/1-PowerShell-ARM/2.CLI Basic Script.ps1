$resourceGroupName="demoCLIScript"
$resourceGroupLocation="eastus"
$appName="somestrangenamegsf"
$password="ThisIsASuperSafePassword#123"

#az login

az group delete -n $resourceGroupName --yes

az group create --name $resourceGroupName --location $resourceGroupLocation

az appservice plan create -g $resourceGroupName -n $appName -l $resourceGroupLocation --sku SHARED
az webapp create -g $resourceGroupName -p $appName -n $appName

az storage account create -n $appName -g $resourceGroupName -l $resourceGroupLocation --sku Standard_LRS

az sql server create -l $resourceGroupLocation -g $resourceGroupName -n $appName -u $appName -p $password

az sql db create -g $resourceGroupName -s $appName -n $appName --service-objective S0

Write-Host "Done!"

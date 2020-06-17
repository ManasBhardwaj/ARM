$rg="Demo-RG"
$loc="North Europe"
$tf = "azuredeploy.json"
$tpf ="azuredeploy.parameters.json"

$ss =  ConvertTo-SecureString "secre@t!" -AsPlainText -Force

#Create RG
az group create --name $rg --location $loc

#Validate
Test-AzResourceGroupDeployment -ResourceGroupName $rg -TemplateFile "$tf" -TemplateParameterFile "$tpf" -Verbose

#Deploy
az deployment group create -g $rg --template-file  $tf --parameters $tpf

#Deploy - pass parameters, securestring
az deployment group create -g $rg --template-file  $tf --parameters $tpf  p-string="Hello World 2" 

az deployment group create -g $rg --template-file  $tf --parameters $tpf  p-string="Hello World 2" p-securestring=$ss



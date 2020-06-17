
$rg="Demo-RG-PaaS"
$loc="South Central US"
$tf = "azuredeploy.json"
$tpf ="azuredeploy.parameters.json"
$uDNS = $rg + "-TM"
$uDNSWA = $rg + "-WA"


#Create RG
az group create --name $rg --location $loc

#Validate
Test-AzResourceGroupDeployment -ResourceGroupName $rg -TemplateFile "$tf" -TemplateParameterFile "$tpf" -Verbose

#Deploy
az deployment group create -g $rg --template-file  $tf --parameters $tpf uniqueDnsName=$uDNS uniqueDnsNameForWebApp=$uDNSWA

#Deploy - pass parameters, securestring
az deployment group create -g $rg --template-file  $tf --parameters $tpf  uniqueDnsName=$uDNS uniqueDnsNameForWebApp=$uDNSWA





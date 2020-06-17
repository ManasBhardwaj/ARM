
#ProviderNameSpace and Locations 
Get-AzResourceProvider | Select-Object ProviderNamespace, Locations | Sort-Object ProviderNamespace,ResourceTypes

#View resource types for a resource provider
(Get-AzResourceProvider -ProviderNamespace Microsoft.Web).ResourceTypes | Select-Object ResourceTypeName

#View valid API, locations for a resource type
Get-AzResourceProvider -ProviderNamespace Microsoft.web  | Select-Object ResourceTypes,Locations | Sort-Object Locations

#View valid API for site respurce type
((Get-AzResourceProvider -ProviderNamespace Microsoft.Web).ResourceTypes | Where-Object {$_.ResourceTypeName -eq 'Sites'}).ApiVersions

 


 



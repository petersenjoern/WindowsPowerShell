<#
    Setup your env:

    env-set azure-init           ''
    env-set azure-subscription   ''
    env-set azure-keyvault       '' 
    env-set AZURE_DEVOPS_EXT_PAT ''
    env-set azure-acr            ''

    env-list azure*
#>


$cloud = env-get azure-init

if ($cloud) {
      
    $subscription=env-get azure-subscription
    $keyvault=env-get azure-keyvault
    
    # az login --help
    az account set -s $subscription
    
    Clear-Host
    Write-Host "Loading Azure $subscription subscription and $keyvault secrets"
}

. "$ProfileHOME\azure\secrets.ps1"
. "$ProfileHOME\azure\vm-connect.ps1"
. "$ProfileHOME\azure\devops.ps1"
. "$ProfileHOME\azure\container-registry.ps1"
. "$ProfileHOME\azure\service-principal.ps1"
. "$ProfileHOME\azure\container-deploy.ps1"
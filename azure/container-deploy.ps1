# Link with many az container create options: 
# https://docs.microsoft.com/en-us/cli/azure/container?view=azure-cli-latest#az-container-create

function aci-deploy {
    param(
        $resourceGroup,
        $containerInstanceName,
        $acrLoginServer,
        $ImageName,
        $ImageVersion,
        $spID,
        $spPW,
        $aciDnsLabel
    )
    az container create --resource-group $resourceGroup --name $containerInstanceName --image "${acrLoginServer}/${ImageName}:${ImageVersion}" --cpu 1 --memory 1 --registry-login-server $acrLoginServer --registry-username $spID --registry-password $spPW --dns-name-label $aciDnsLabel --ports 80
}

function aci-deploy-from-yaml {
    # Deploys ACI from a yaml file
    # However, password has to be written in the yaml file currently
    # TODO: change that password is never exposed in yaml but inserted from keyvault
    param(
        $resourceGroup,
        $filePath
    )
    az container create --resource-group $resourceGroup --file $filePath
}

function aci-deployment-state {
    # Obtain the deployment state (e.g. running or still in deployment or failed)
    param(
        $resourceGroup,
        $containerInstanceName
    )
    az container show --resource-group $ResourceGroup --name $containerInstanceName --query instanceView.state
}

function aci-app-address {
    # Obtain the FQDN address where the ACI is deployed to
    param(
        $resourceGroup,
        $containerInstanceName
    )
    az container show --resource-group $ResourceGroup --name $containerInstanceName --query ipAddress.fqdn
}

function aci-logs {
    # Obtain Logs from within the deployed container
    param(
        $resourceGroup,
        $containerInstanceName
    )
    az container logs --resource-group $ResourceGroup --name $containerInstanceName
}

function aci-start-all-containers {
    # Starts all containers in a container group.
    param(
        $resourceGroup,
        $containerInstanceName
    )
    az container start --resource-group $ResourceGroup --name $containerInstanceName
}

function aci-stop-all-containers {
    # Stops all containers in a container group.
    param(
        $resourceGroup,
        $containerInstanceName
    )
    az container stop --resource-group $ResourceGroup --name $containerInstanceName
}
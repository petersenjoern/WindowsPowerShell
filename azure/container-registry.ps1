
$acr=env-get azure-acr

function acr-login {
    # 1. You must log in to your Azure Container Registry instance before pushing images to it
    az acr login --name $acr
}

function acr-show-reg-loginServer {
    # 2. To push a container image to a private registry like Azure Container Registry, 
    # you must first tag the image with the full name of the registry's login server.
    $ARC_LOGINSERVER = (az acr show --name $acr --query loginServer --output table)
    return $ARC_LOGINSERVER
}

function acr-show-reg-id {
    #Obtain the full registry ID
    $ACR_REGISTRY_ID = (az acr show --name $acr --query id --output tsv)
    return $ACR_REGISTRY_ID
}


function acr-list-images {
    # To verify that the image you just pushed is indeed in your Azure container registry, 
    # list the images in your registry with the az acr repository list command
    az acr repository list --name $acr --output table
}

function acr-list-images-tags {
    # To see the tags for a specific image
    param(
        $ImageName
    )
    az acr repository show-tags --name $acr --repository $ImageName --output table
}
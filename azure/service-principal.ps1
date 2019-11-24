# Use a service-principal account for various scenarios:
# https://docs.microsoft.com/en-us/azure/container-registry/container-registry-auth-aci

function create-sp-acr {
    # Create the service principal with rights scoped to the registry.
    # Default permissions are for docker pull access. Modify the '--role'
    # argument value as desired:
    # acrpull:     pull only
    # acrpush:     push and pull
    # owner:       push, pull, and assign roles

    # SERVICE_PRINCIPAL_NAME: Must be unique within your AD tenant
    # ACR_REGISTRY_ID: ps function: acr-show-reg-id "(az acr show --name $acr --query id --output tsv)"
    # $acr is the name of your Azure Container Registry
    param(
        $SERVICE_PRINCIPAL_NAME,
        $ACR_REGISTRY_ID
    )

    #Create an hashtable variable for returning multiple variables
    [hashtable]$Return = @{}

    $SP_PASSWD = (az ad sp create-for-rbac --name "http://${SERVICE_PRINCIPAL_NAME}" --scopes $ACR_REGISTRY_ID --role acrpull --query password --output tsv)
    $SP_APP_ID = (az ad sp show --id "http://${SERVICE_PRINCIPAL_NAME}" --query appId --output tsv)
    
    $Return.SP_PASSWD = $SP_PASSWD
    $Return.SP_APP_ID = $SP_APP_ID
    Write-Host "Store the SP_PASSWD and SP_APP_ID in your Keyvault now!"
    return $Return
}


function sp-list-all {
    param(
        $SERVICE_PRINCIPAL_NAME
    )
    az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].{id:appId, tenant:appOwnerTenantId}"
}


function sp-assign-role-acr {
    # SERVICE_PRINCIPAL_ID=<service-principal-ID> (use the sp-list-all function)
    # ACR_REGISTRY_ID: ps function: acr-show-reg-id "(az acr show --name $acr --query id --output tsv)"
    # $acr is the name of your Azure Container Registry
    param(
        $SERVICE_PRINCIPAL_ID,
        $ACR_REGISTRY_ID
    )
    # Assign the desired role to the service principal. Modify the '--role' argument
    # value as desired:
    # acrpull:     pull only
    # acrpush:     push and pull
    # owner:       push, pull, and assign roles
    az role assignment create --assignee $SERVICE_PRINCIPAL_ID --scope $ACR_REGISTRY_ID --role acrpull
}


function sp-login {
    # SERVICE_PRINCIPAL_NAME = You can find your service-principal-name in portal.azure; if not existing, create one with sp-create function
    # PASSWORD = comes with the creation of a SP account, find it in your Keyvault (if you have saved it immediately), else reset your sp password
    # TENANT_ID = use the sp-list-all function with your SERVICE_PRINCIPAL_NAME as parameter
    param(
        $SERVICE_PRINCIPAL_NAME,
        $PASSWORD,
        $TENANT_ID
    )
    az login --service-principal --username $SERVICE_PRINCIPAL_NAME --password $PASSWORD --tenant $TENANT_ID
}
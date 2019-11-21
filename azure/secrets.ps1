function get-azure-secret{
    param(
        $keyvault,
        $secretName
    )
    $myPassword=(az keyvault secret show --vault-name $keyvault --name $secretName --query "value" --output tsv)
    return $myPassword
}


function new-azure-secret{
    param(
        $keyvault,
        $secretName,
        $secretValue
    )
    az keyvault secret set --vault-name $keyvault   --name $secretName --value $secretValue
}

function list-azure-secret {
    param(
        $keyvault
    )
    az keyvault secret list  --vault-name $keyvault --query "[].id"
}

function set-azure-devops-secret {
    param($repoName)
    env-get dev | az devops login --organization "https://dev.azure.com/$repoName"
}

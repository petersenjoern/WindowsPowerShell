function aci-list {
    # List container groups.
    param(
        $resourceGroup
    )
    az container list --resource-group $resourceGroup
}

function aci-export-container-group-yaml {
    # Export a container group in yaml.
    param(
        $resourceGroup,
        $containerInstanceName,
        $yamlPath
    )
    az container export -g $resourceGroup --name $containerInstanceName -f "${yamlPath}.yaml"
}
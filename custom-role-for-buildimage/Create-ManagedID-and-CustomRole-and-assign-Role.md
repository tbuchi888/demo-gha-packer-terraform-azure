# Create-ManagedID-and-CustomRole-and-assign-Role
This is the work required for GIthub Actions for image creation using Azure Image Builder.
https://docs.microsoft.com/en-us/azure/developer/github/build-vm-image

## Create-ManagedID
https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azcli

```
USER-ASSIGNED-IDENTITY-NAM="image-builder-m-id"
RESOURCE-GROUP="demo-image-builder-rg"
az identity create -g ${RESOURCE-GROUP} -n ${USER-ASSIGNED-IDENTITY-NAME}
az identity list -g ${RESOURCE-GROUP}
```

## Create-CustomRole
https://docs.microsoft.com/ja-jp/azure/role-based-access-control/custom-roles-cli
https://docs.microsoft.com/ja-jp/azure/role-based-access-control/custom-roles-portal

```
subscriptionID=`az account show --query id --output tsv`
cat customrole.json
{
    "Name": "Image Creation Role",
    "IsCustom": true,
    "Description": "Azure Image Builder access to create resources for the image build",
    "Actions": [
        "Microsoft.Compute/galleries/read",
        "Microsoft.Compute/galleries/images/read",
        "Microsoft.Compute/galleries/images/versions/read",
        "Microsoft.Compute/galleries/images/versions/write",

        "Microsoft.Compute/images/write",
        "Microsoft.Compute/images/read",
        "Microsoft.Compute/images/delete"
    ],
    "NotActions": [
  
    ],
    "AssignableScopes": [
      "/subscriptions/${subscriptionID}/resourceGroups/<rgName>"
    ]
  }
```

## assign-Role

```
az role assignment create --assignee "OB" \
--role "{roleNameOrId}" \
--resource-group ${RESOURCE-GROUP}
```

example
```
$ az role assignment create --assignee "xxx-MANAGEDID-principalId--xxx" \
> --role "xxxx-ROLEID-xxxxxxxxxxxxxxxx" \
> --resource-group "demo_image_builder"
{
  "canDelegate": null,
  "condition": null,
  "conditionVersion": null,
  "description": null,
  "id": "/subscriptions/xxxxxx/resourceGroups/demo_image_builder/providers/Microsoft.Authorization/roleAssignments/xxxxxxxxxxxxxxxxxx",
  "name": "XXXXXXXXXXXXXXXXXXXXXXXXXX",
  "principalId": "XXXXXXXXX",
  "principalType": "ServicePrincipal",
  "resourceGroup": "demo_image_builder",
  "roleDefinitionId": "/subscriptions/XXXXXXXX/providers/Microsoft.Authorization/roleDefinitions/XXXXX",
  "scope": "/subscriptions/xxxxxxxxxxx/resourceGroups/demo_image_builder",
  "type": "Microsoft.Authorization/roleAssignments"
}
```

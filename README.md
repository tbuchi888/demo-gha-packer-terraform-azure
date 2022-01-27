# demo-gha-packer-terraform-azure
This repository is a demo of using Github Actions to build VM images via Packer and deploy VM and VNet, Subnets, NSG etc..., to Azure with terraform.
## reference
I used the following manual as a reference.
+ https://docs.microsoft.com/en-us/azure/virtual-machines/linux/build-image-with-packer
+ https://docs.microsoft.com/en-us/azure/developer/github/build-vm-image
+ https://askubuntu.com/questions/1263020/what-is-the-azure-vm-image-urn-for-ubuntu-server-20-04-lts
+ https://docs.microsoft.com/ja-jp/azure/developer/terraform/create-linux-virtual-machine-with-infrastructure
+ https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
+ https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples
+ https://github.com/Azure/actions-workflow-samples/blob/master/assets/create-secrets-for-GitHub-workflows.md
  + In creating the SP, create it without a resource group as the scope, and use only the following for Secret registration of AZURE_CREDENTIALS.
    + "clientId"
    + "clientSecret"
    + "subscriptionId"
    + "tenantId"

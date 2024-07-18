terraform {
  backend "azurerm" {
    resource_group_name  = "demo-terraform"
    storage_account_name = "tbuchi888tfstate2407"
    container_name       = "backendcontainer"
    key                  = "packer-custom-vm-terraformv990v3.tfstate"
  }
}

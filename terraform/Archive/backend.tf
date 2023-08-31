terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-n01545552-RG"
    storage_account_name = "tfstaten01545552sa"
    container_name       = "tfstatefilesassignment"
    key                  = "tfstate"
  }
}
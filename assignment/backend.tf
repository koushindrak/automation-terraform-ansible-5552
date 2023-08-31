terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01545552RG"
    storage_account_name = "tfstaten01545552sa"
    container_name       = "tfstatefiles"
    key                  = "tf_state_assignment_file"
  }
}
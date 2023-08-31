resource "azurerm_resource_group" "network_resource_group" {
  name     = var.network_res_grp
  location = var.location
}

resource "azurerm_resource_group" "linux_resource_group" {
  name     = var.linux_res_grp
  location = var.location
}

resource "azurerm_resource_group" "windows_resource_group" {
  name     = var.windows_res_grp
  location = var.location
}

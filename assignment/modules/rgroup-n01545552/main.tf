resource "azurerm_resource_group" "resource_grp" {
  name     = var.resource_group.name
  location = var.resource_group.location
  tags     = local.common_tags
}



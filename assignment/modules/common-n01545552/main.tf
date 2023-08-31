resource "azurerm_storage_account" "storage" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group.name
  location                 = var.resource_group.location
  account_tier             = var.storage_attributes.tier
  account_replication_type = var.storage_attributes.replication
  tags                     = local.common_tags
}

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.workspace_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = var.workspace_attributes.sku
  retention_in_days   = var.workspace_attributes.retention
  tags                = local.common_tags
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = var.vault_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = var.vault_attributes.sku
  tags                = local.common_tags
}

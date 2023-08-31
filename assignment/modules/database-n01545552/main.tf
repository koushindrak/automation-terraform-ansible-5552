resource "azurerm_postgresql_server" "postgresql_server" {
  name                         = var.database_server_name
  location                     = var.resource_group.location
  resource_group_name          = var.resource_group.name
  sku_name                     = var.database_server_config.sku_name
  storage_mb                   = var.database_server_config.storage_mb
  backup_retention_days        = var.database_server_config.backup_retention_days
  geo_redundant_backup_enabled = var.database_server_config.geo_redundant_backup_enabled
  auto_grow_enabled            = var.database_server_config.auto_grow_enabled
  administrator_login          = var.database_server_config.administrator_login
  administrator_login_password = var.database_server_config.administrator_login_password
  version                      = var.database_server_config.version
  ssl_enforcement_enabled      = var.database_server_config.ssl_enforcement_enabled
  tags                         = local.common_tags

}

resource "azurerm_postgresql_database" "database" {
  name                = var.database_name
  resource_group_name = azurerm_postgresql_server.postgresql_server.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  charset             = var.database_props.charset
  collation           = var.database_props.collation
}
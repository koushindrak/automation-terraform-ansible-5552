output "postgresql_server_name" {
  value = azurerm_postgresql_server.postgresql_server.name
}
output "postgresql_database_name" {
  value = azurerm_postgresql_database.database.name
}


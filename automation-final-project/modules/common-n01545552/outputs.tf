output "storage_account_uri" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}

output "azure_storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.workspace.name
}

output "recovery_services_vault_name" {
  value = azurerm_recovery_services_vault.vault.name
}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.workspace.id
}
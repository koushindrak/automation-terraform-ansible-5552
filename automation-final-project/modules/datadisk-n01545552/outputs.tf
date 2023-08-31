output "linux_disk_name" {
  value = azurerm_managed_disk.linux_disk_config[*].name
}


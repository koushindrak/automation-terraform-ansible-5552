output "windows_disk_name" {
  value = azurerm_managed_disk.win_disk_config[*].name
}
output "linux_disk_name" {
  value = azurerm_managed_disk.linux_disk_config[*].name
}


output "net_res_grp_name" {
  value = azurerm_resource_group.network_resource_group.name
}
output "net_res_grp_location" {
  value = azurerm_resource_group.network_resource_group.location
}

output "linux_res_grp_name" {
  value = azurerm_resource_group.linux_resource_group.name
}
output "linux_res_grp_location" {
  value = azurerm_resource_group.linux_resource_group.location
}

output "windows_res_grp_name" {
  value = azurerm_resource_group.windows_resource_group.name
}
output "windows_res_grp_location" {
  value = azurerm_resource_group.windows_resource_group.location
}
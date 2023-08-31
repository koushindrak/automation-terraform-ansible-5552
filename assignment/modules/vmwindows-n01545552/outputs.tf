output "win_machine_id" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine[*].id
}
output "win_machine_name" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine[*].name
}
output "win_machine_public_ip" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine[*].public_ip_address
}
output "win_machine_private_ip" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine[*].private_ip_address
}
output "win_machine_fqdn" {
  value = azurerm_public_ip.windows_public_ip[*].fqdn
}

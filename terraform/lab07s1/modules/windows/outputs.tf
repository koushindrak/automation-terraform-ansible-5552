output "WINDOW_VM_NAME" {
  value = values(azurerm_windows_virtual_machine.window_vm)[*].name
}
output "WINDOW_VM_FQDN" {
  value = values(azurerm_public_ip.window_public_ip)[*].fqdn
}
output "WINDOW_VM_PRIVATE_IP" {
  value = values(azurerm_windows_virtual_machine.window_vm)[*].private_ip_address
}
output "WINDOW_VM_PUBLIC_IP" {
  value = values(azurerm_windows_virtual_machine.window_vm)[*].public_ip_address
}
output "WINDOW_AVAIL_SET" {
  value = azurerm_availability_set.window_availablity_set.name
}

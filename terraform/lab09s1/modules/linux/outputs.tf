output "linux_vm_name" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].name]
}
output "linux_vm_fqdn" {
  value = [azurerm_public_ip.public_ip[*].fqdn]
}
output "linux_vm_private_ip" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].private_ip_address]
}
output "linux_vm_public_ip" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].public_ip_address]
}
output "linux_avs_set" {
  value = azurerm_availability_set.av_set.name
}

output "linux_machine_name" {
  value = values(azurerm_linux_virtual_machine.virtual_machine)[*].name
}
output "linux_machine_full_domain_name" {
  value = values(azurerm_public_ip.public_ip)[*].fqdn
}
output "linux_machine_public_ip" {
  value = values(azurerm_linux_virtual_machine.virtual_machine)[*].public_ip_address
}
output "linux_machine_private_ip" {
  value = values(azurerm_linux_virtual_machine.virtual_machine)[*].private_ip_address
}
output "linux_nic_id" {
  value = values(azurerm_network_interface.network_interface_card)[*].id
}
output "linux_ip_configs" {
  value = flatten(values(azurerm_network_interface.network_interface_card)[*].ip_configuration[*].name)
}
output "linux_machine_id" {
  value = values(azurerm_linux_virtual_machine.virtual_machine)[*].id
}

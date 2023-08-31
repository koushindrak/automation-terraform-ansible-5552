output "vm_hostname" {
  description = "Virtual Machine host name"
  value       = azurerm_linux_virtual_machine.virtual_machine.name
}

output "vm_fqdn" {
  description = "The fully qualified domain name of the VM"
  value       = azurerm_public_ip.public_ip.fqdn
}

output "vm_private_ip" {
  description = "VM's Private IP"
  value       = azurerm_network_interface.interface.private_ip_address
}

output "vm_public_ip" {
  description = "VM's Public IP"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "virtual_network_name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.first-rg-net.name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.first-rg-net.address_space
}

output "first_subnet_name" {
  description = "First Subnet name"
  value       = azurerm_subnet.first-rg-net-subnet1.name
}

output "first_subnet_address_space" {
  description = "The address space of the first subnet"
  value       = azurerm_subnet.first-rg-net-subnet1.address_prefixes
}

output "second_subnet_name" {
  description = "Second Subnet Name"
  value       = azurerm_subnet.first-rg-net-subnet2.name
}

output "second_subnet_address_space" {
  description = "The address space of the second subnet"
  value       = azurerm_subnet.first-rg-net-subnet2.address_prefixes
}

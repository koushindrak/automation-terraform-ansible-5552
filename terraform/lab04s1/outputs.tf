output "avs_name" {
  description = "Linux Availability Set Name"
  value       = azurerm_availability_set.av_set.name
}
output "vm_hostnames" {
  description = "Server  names"
  value       = azurerm_linux_virtual_machine.virtual_machine[*].name
}

output "vm_fqdns" {
  description = "The fully qualified domain names of the servers"
  value       = azurerm_public_ip.public_ip[*].fqdn
}

output "vm_private_ips" {
  description = "Servers' Private IP addresses"
  value       = azurerm_network_interface.interface[*].private_ip_address
}

output "vm_public_ips" {
  description = "Servers' Public IP addresses"
  value       = azurerm_public_ip.public_ip[*].ip_address
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

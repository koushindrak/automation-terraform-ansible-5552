output "virtual_net_name" {
  value = azurerm_virtual_network.virtual_net.name
}
output "virtual_net_space" {
  value = azurerm_virtual_network.virtual_net.address_space
}

output "first_subnet_id" {
  value = azurerm_subnet.first_subnet.id
}
output "first_subnet_name" {
  value = azurerm_subnet.first_subnet.name
}
output "first_subnet_space" {
  value = azurerm_subnet.first_subnet.address_prefixes
}

output "second_subnet_id" {
  value = azurerm_subnet.second_subnet.id
}
output "second_subnet_name" {
  value = azurerm_subnet.second_subnet.name
}
output "second_subnet_space" {
  value = azurerm_subnet.second_subnet.address_prefixes
}

output "first_nsg_name" {
  value = azurerm_network_security_group.first_nsg.name
}
output "second_nsg_name" {
  value = azurerm_network_security_group.second_nsg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.virtual_net1.name
}
output "subnet_name" {
  value = azurerm_subnet.subnet1.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet1.id
}

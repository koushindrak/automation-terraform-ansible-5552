resource "azurerm_virtual_network" "virtual_net1" {
  name                = var.vnet1_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  address_space       = var.vnet1_space
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_virtual_network.virtual_net1.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_net1.name
  address_prefixes     = var.subnet1_space
}

resource "azurerm_network_security_group" "security_group1" {
  name                = var.nsg1_name
  location            = azurerm_virtual_network.virtual_net1.location
  resource_group_name = azurerm_virtual_network.virtual_net1.resource_group_name
  tags                = local.common_tags

}

resource "azurerm_network_security_rule" "security_rules" {
  for_each                    = local.inbound_access_rules
  destination_port_range      = each.value.destination_port_range
  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  network_security_group_name = azurerm_network_security_group.security_group1.name
  resource_group_name         = azurerm_virtual_network.virtual_net1.resource_group_name
  protocol                    = each.value.protocol
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  access                      = each.value.access
  source_port_range           = each.value.source_port_range
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_mapping" {
  network_security_group_id = azurerm_network_security_group.security_group1.id
  subnet_id                 = azurerm_subnet.subnet1.id
}

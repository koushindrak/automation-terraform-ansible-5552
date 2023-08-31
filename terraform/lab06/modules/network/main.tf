resource "azurerm_virtual_network" "virtual_net" {
  name                = var.virtual_net_name
  location            = var.location
  resource_group_name = var.res_grp
  address_space       = var.virtual_net_space
}

resource "azurerm_subnet" "first_subnet" {
  name                 = var.first_subnet
  resource_group_name  = azurerm_virtual_network.virtual_net.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_net.name
  address_prefixes     = var.first_subnet_space
}

resource "azurerm_subnet" "second_subnet" {
  name                 = var.second_subnet
  resource_group_name  = azurerm_virtual_network.virtual_net.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_net.name
  address_prefixes     = var.sec_subnet_space
}

resource "azurerm_network_security_group" "first_nsg" {
  name                = var.first_nsg
  location            = azurerm_virtual_network.virtual_net.location
  resource_group_name = azurerm_virtual_network.virtual_net.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    access                     = "Allow"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_network_security_group" "second_nsg" {
  name                = var.second_nsg
  location            = azurerm_virtual_network.virtual_net.location
  resource_group_name = azurerm_virtual_network.virtual_net.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    access                     = "Allow"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    access                     = "Allow"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_mapping1" {
  subnet_id                 = azurerm_subnet.first_subnet.id
  network_security_group_id = azurerm_network_security_group.first_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_mapping2" {
  subnet_id                 = azurerm_subnet.second_subnet.id
  network_security_group_id = azurerm_network_security_group.second_nsg.id
}



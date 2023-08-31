
resource "azurerm_resource_group" "first-rg" {
  name     = var.rg
  location = var.location
}

resource "azurerm_virtual_network" "first-rg-net" {
  name                = var.vnet
  address_space       = var.vn-space
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name
}

resource "azurerm_subnet" "first-rg-net-subnet1" {
  name                 = var.subnet1
  address_prefixes     = var.space1
  virtual_network_name = azurerm_virtual_network.first-rg-net.name
  resource_group_name  = azurerm_resource_group.first-rg.name
}

resource "azurerm_subnet" "first-rg-net-subnet2" {
  name                 = var.subnet2
  address_prefixes     = var.space2
  resource_group_name  = azurerm_resource_group.first-rg.name
  virtual_network_name = azurerm_virtual_network.first-rg-net.name
}

resource "azurerm_network_security_group" "security-group1" {
  name                = var.nsg1
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_network_security_group" "security-group2" {
  name                = var.nsg2
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "subnet1-nsg1-mapping" {
  subnet_id                 = azurerm_subnet.first-rg-net-subnet1.id
  network_security_group_id = azurerm_network_security_group.security-group1.id
}

resource "azurerm_subnet_network_security_group_association" "subnet2-nsg2-mapping" {
  subnet_id                 = azurerm_subnet.first-rg-net-subnet2.id
  network_security_group_id = azurerm_network_security_group.security-group2.id
}
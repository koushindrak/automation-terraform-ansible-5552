provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "first-rg" {
  name     = "network-rg"
  location = "canadacentral"
}

resource "azurerm_virtual_network" "first-rg-vnet" {
  name                = "network-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name
}

resource "azurerm_subnet" "first-rg-vnet-subnet1" {
  name                 = "network-subnet1"
  address_prefixes     = ["10.0.0.0/24"]
  virtual_network_name = azurerm_virtual_network.first-rg-vnet.name
  resource_group_name  = azurerm_resource_group.first-rg.name
}

resource "azurerm_subnet" "first-rg-vnet-subnet2" {
  name                 = "network-subnet2"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.first-rg-vnet.name
  resource_group_name  = azurerm_resource_group.first-rg.name
}

resource "azurerm_network_security_group" "security-group1" {
  name                = "network-nsg1"
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
name                = "network-nsg2"
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
  subnet_id                 = azurerm_subnet.first-rg-vnet-subnet1.id
  network_security_group_id = azurerm_network_security_group.security-group1.id
}

resource "azurerm_subnet_network_security_group_association" "subnet2-nsg2-mapping" {
  subnet_id                 = azurerm_subnet.first-rg-vnet-subnet2.id
  network_security_group_id = azurerm_network_security_group.security-group2.id
}
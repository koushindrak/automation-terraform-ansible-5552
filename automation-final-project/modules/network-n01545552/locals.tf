locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "koushindra.kumar"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }

  inbound_access_rules = {
    allow_rdp = {
      name                       = "rdp"
      priority                   = 220
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    allow_ssh = {
      name                       = "ssh"
      priority                   = 210
      source_port_range          = "*"
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    allow_http = {
      name                       = "http"
      priority                   = 230
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
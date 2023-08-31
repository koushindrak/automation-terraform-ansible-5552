resource "azurerm_network_interface" "interface" {
  name                = "${var.server_name}-nic"
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name
  ip_configuration {
    name                          = "${var.server_name}-ipconfig"
    subnet_id                     = azurerm_subnet.first-rg-net-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = {
    Name         = local.Name
    Project      = local.Project
    ContactEmail = local.ContactEmail
    Environment  = local.Environment
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.server_name}-pip"
  resource_group_name = azurerm_resource_group.first-rg.name
  location            = azurerm_resource_group.first-rg.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.server_name}-n01545552"
  tags = {
    Name         = local.Name
    Project      = local.Project
    ContactEmail = local.ContactEmail
    Environment  = local.Environment
  }
}


resource "azurerm_linux_virtual_machine" "virtual_machine" {
  name                  = var.server_name
  location              = azurerm_resource_group.first-rg.location
  resource_group_name   = azurerm_resource_group.first-rg.name
  network_interface_ids = [azurerm_network_interface.interface.id]
  size                  = var.server_size
  admin_username        = var.un
  os_disk {
    name                 = "${var.server_name}-os_disk"
    disk_size_gb         = var.disk_size
    storage_account_type = var.disk_type
    caching              = var.disk_caching
  }
  admin_ssh_key {
    username   = var.un
    public_key = file(var.publickey)
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.os_version
  }
  tags = {
    Name         = local.Name
    Project      = local.Project
    ContactEmail = local.ContactEmail
    Environment  = local.Environment
  }
}
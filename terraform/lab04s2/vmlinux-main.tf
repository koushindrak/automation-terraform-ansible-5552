resource "azurerm_network_interface" "interface" {
  count               = var.nb_count
  name                = "${var.server_name}-${count.index}-nic"
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name
  ip_configuration {
    name                          = "${var.server_name}-${count.index}-ipconfig"
    subnet_id                     = azurerm_subnet.first-rg-net-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.public_ip.*.id, count.index)
  }

  tags = {
    Name    = "${var.server_name}-${count.index}-nic"
    Project = local.Project
  }
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.nb_count
  name                = "${var.server_name}-${count.index}-publicip"
  resource_group_name = azurerm_resource_group.first-rg.name
  location            = azurerm_resource_group.first-rg.location
  allocation_method   = "Dynamic"
  domain_name_label   = "n01545552-${var.server_name}-${count.index}-label"
  tags = {
    Name    = "${var.server_name}-${count.index}-publicip"
    Project = local.Project
  }
}


resource "azurerm_linux_virtual_machine" "virtual_machine" {
  count                 = var.nb_count
  name                  = "${var.server_name}-${count.index}"
  location              = azurerm_resource_group.first-rg.location
  resource_group_name   = azurerm_resource_group.first-rg.name
  network_interface_ids = [azurerm_network_interface.interface[count.index].id]
  size                  = var.server_size
  admin_username        = var.un
  availability_set_id   = azurerm_availability_set.av_set.id

  os_disk {
    name                 = "${var.server_name}-${count.index}-os_disk"
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
    Name    = "${var.server_name}-${count.index}-vm"
    Project = local.Project
  }
}

resource "azurerm_availability_set" "av_set" {
  name                         = var.linux_avs
  location                     = azurerm_resource_group.first-rg.location
  resource_group_name          = azurerm_resource_group.first-rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5

  tags = {
    Name    = "${var.linux_avs}"
    Project = local.Project
  }
}

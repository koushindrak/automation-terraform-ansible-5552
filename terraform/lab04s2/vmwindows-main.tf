resource "azurerm_network_interface" "win_interface" {
  count               = length(var.windows_name)
  name                = "${keys(var.windows_name)[count.index]}-nic"
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name

  ip_configuration {
    name                          = "${keys(var.windows_name)[count.index]}-ipconfig"
    subnet_id                     = azurerm_subnet.first-rg-net-subnet2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win_public_ip[count.index].id
  }

  tags = {
    Name    = "${keys(var.windows_name)[count.index]}-nic"
    Project = local.Project
  }
}

resource "azurerm_public_ip" "win_public_ip" {
  count               = length(var.windows_name)
  name                = "${keys(var.windows_name)[count.index]}-pip"
  resource_group_name = azurerm_resource_group.first-rg.name
  location            = azurerm_resource_group.first-rg.location
  allocation_method   = "Dynamic"

  tags = {
    Name    = "${keys(var.windows_name)[count.index]}-pip"
    Project = local.Project
  }
}

resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  count                 = length(var.windows_name)
  name                  = keys(var.windows_name)[count.index]
  location              = azurerm_resource_group.first-rg.location
  resource_group_name   = azurerm_resource_group.first-rg.name
  network_interface_ids = [azurerm_network_interface.win_interface[count.index].id]
  size                  = var.windows_name[keys(var.windows_name)[count.index]]
  computer_name         = keys(var.windows_name)[count.index]
  admin_username        = var.win_admin_name
  admin_password        = "Azure@123456"
  availability_set_id   = azurerm_availability_set.win_av_set.id

  os_disk {
    name                 = "${keys(var.windows_name)[count.index]}-os_disk"
    caching              = var.win_disk_caching
    disk_size_gb         = var.win_disk_size
    storage_account_type = var.win_disk_type
  }

  source_image_reference {
    publisher = var.win_publisher
    offer     = var.win_offer
    sku       = var.win_sku
    version   = var.win_os_version
  }

  winrm_listener {
    protocol = "Http"
  }

  tags = {
    Name    = keys(var.windows_name)[count.index]
    Project = local.Project
  }
}

resource "azurerm_availability_set" "win_av_set" {
  name                         = var.windows_avs
  location                     = azurerm_resource_group.first-rg.location
  resource_group_name          = azurerm_resource_group.first-rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5

  tags = {
    Name    = var.windows_avs
    Project = local.Project
  }
}

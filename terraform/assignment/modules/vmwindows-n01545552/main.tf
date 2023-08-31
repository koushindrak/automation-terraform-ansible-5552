resource "azurerm_public_ip" "windows_public_ip" {
  count               = var.nb_count
  name                = "${var.win_vm_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  allocation_method   = var.win_public_ip_properties.allocation_method
  domain_name_label   = "${var.win_vm_name}${format("%1d", count.index + 1)}"
  sku                 = var.win_public_ip_properties.sku
  tags                = local.common_tags
}

resource "azurerm_network_interface" "window_network_interface_card" {
  count               = var.nb_count
  name                = "${var.win_vm_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  ip_configuration {
    name                          = "${var.win_vm_name}-ip-config-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = var.win_private_ip_properties
    public_ip_address_id          = element(azurerm_public_ip.windows_public_ip[*].id, count.index + 1)
  }
  depends_on = [azurerm_public_ip.windows_public_ip]
  tags       = local.common_tags
}

resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  count                 = var.nb_count
  name                  = "${var.win_vm_name}${format("%1d", count.index + 1)}"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [element(azurerm_network_interface.window_network_interface_card[*].id, count.index + 1)]
  size                  = var.win_vm_size
  admin_username        = var.win_admin_name
  admin_password        = var.win_password
  availability_set_id   = azurerm_availability_set.windows_availability_set.id
  depends_on            = [azurerm_availability_set.windows_availability_set]

  os_disk {
    name                 = "${var.win_vm_name}-os-disk${format("%1d", count.index + 1)}"
    caching              = var.win_disk_properties.caching
    storage_account_type = var.win_disk_properties.type
    disk_size_gb         = var.win_disk_properties.size
  }


  source_image_reference {
    publisher = var.win_os_properties.publisher
    offer     = var.win_os_properties.offer
    sku       = var.win_os_properties.sku
    version   = var.win_os_properties.version
  }

  winrm_listener {
    protocol = "Http"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_acc_uri
  }
  tags = local.common_tags
}

resource "azurerm_availability_set" "windows_availability_set" {
  name                         = var.win_avs_name
  location                     = var.resource_group.location
  resource_group_name          = var.resource_group.name
  platform_update_domain_count = var.windows_avs_properties.platform_update_domain_count
  platform_fault_domain_count  = var.windows_avs_properties.platform_fault_domain_count
  tags                         = local.common_tags
}

resource "azurerm_virtual_machine_extension" "ext1" {
  count = var.nb_count
  name  = var.ext1.type

  virtual_machine_id   = element(azurerm_windows_virtual_machine.windows_virtual_machine[*].id, count.index + 1)
  publisher            = var.ext1.publisher
  type                 = var.ext1.type
  type_handler_version = var.ext1.type_handler_version
  auto_upgrade_minor_version = var.ext1.auto_upgrade_minor_version
  depends_on = [
    azurerm_windows_virtual_machine.windows_virtual_machine,
  ]
  tags = local.common_tags
}
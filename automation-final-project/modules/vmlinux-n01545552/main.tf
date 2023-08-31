resource "azurerm_public_ip" "public_ip" {
  for_each              = var.linux_vm_names_zones
  name                  = "${each.key}-public_ip"
  resource_group_name   = var.resource_group.name
  location              = var.resource_group.location
  allocation_method     = var.public_ip_properties.allocation_method
  domain_name_label     = each.key
  sku                   = var.public_ip_properties.sku
  tags                  = local.common_tags
}

resource "azurerm_network_interface" "network_interface_card" {
  for_each              = var.linux_vm_names_zones
  name                  = "${each.key}-nic"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  depends_on            = [azurerm_public_ip.public_ip]
  tags                  = local.common_tags

  ip_configuration {
    name                          = "${each.key}-ip-config"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = var.private_ip_props
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machine" {
  for_each              = var.linux_vm_names_zones
  name                  = each.key
  resource_group_name   = var.resource_group.name
  location              = var.resource_group.location
  network_interface_ids = [azurerm_network_interface.network_interface_card[each.key].id]
  size                  = var.machine_size
  admin_username        = var.admin_name
  tags                  = local.common_tags
  zone                  = each.value

  source_image_reference {
    publisher = var.linux_machine_config.publisher
    offer     = var.linux_machine_config.offer
    sku       = var.linux_machine_config.sku
    version   = var.linux_machine_config.version
  }

  admin_ssh_key {
    username   = var.admin_name
    public_key = file(var.public_id_rsa_key)
  }

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.linux_disk_attributes.caching
    storage_account_type = var.linux_disk_attributes.disk_type
    disk_size_gb         = var.linux_disk_attributes.size
  }

  boot_diagnostics {
    storage_account_uri = var.storage_acc_uri
  }
}

resource "azurerm_virtual_machine_extension" "extension1" {
  for_each              = var.linux_vm_names_zones
  name                 = var.ext1.type
  virtual_machine_id   = azurerm_linux_virtual_machine.virtual_machine[each.key].id
  publisher            = var.ext1.publisher
  type                 = var.ext1.type
  type_handler_version = var.ext1.type_handler_version
  tags                 = local.common_tags
  auto_upgrade_minor_version = var.ext1.auto_upgrade_minor_version

  depends_on = [
    null_resource.linux_provisioner,
    azurerm_linux_virtual_machine.virtual_machine,
  ]
}

resource "azurerm_virtual_machine_extension" "ext2" {
  for_each              = var.linux_vm_names_zones
  name                 = var.ext2.type
  virtual_machine_id   = azurerm_linux_virtual_machine.virtual_machine[each.key].id
  publisher            = var.ext2.publisher
  type_handler_version = var.ext2.type_handler_version
  type                 = var.ext2.type
  tags                 = local.common_tags
  auto_upgrade_minor_version = var.ext2.auto_upgrade_minor_version

  depends_on = [
    null_resource.linux_provisioner,
    azurerm_linux_virtual_machine.virtual_machine,
  ]
}

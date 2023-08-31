resource "azurerm_public_ip" "pip" {
  count               = var.nb_count
  name                = "${var.vm_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.res_grp
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.vm_name}${format("%1d", count.index + 1)}"
  tags                = local.common_tags
}

resource "azurerm_network_interface" "nic" {
  count               = var.nb_count
  name                = "${var.vm_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.res_grp

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.sn_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.pip[*].id, count.index + 1)
  }
  depends_on = [azurerm_public_ip.pip]
  tags       = local.common_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = var.nb_count
  name                  = "${var.vm_name}${format("%1d", count.index + 1)}"
  computer_name         = "${var.vm_name}${format("%1d", count.index + 1)}"
  location              = var.location
  resource_group_name   = var.res_grp
  network_interface_ids = [element(azurerm_network_interface.nic[*].id, count.index + 1)]
  size                  = var.vm_size
  admin_username        = var.admin_un
  availability_set_id   = azurerm_availability_set.avset.id
  depends_on            = [azurerm_availability_set.avset]

  os_disk {
    name                 = "${var.vm_name}-os-disk${format("%1d", count.index + 1)}"
    caching              = var.disk_attrs.caching
    storage_account_type = var.disk_attrs.type
    disk_size_gb         = var.disk_attrs.size
  }

  admin_ssh_key {
    username   = var.admin_un
    public_key = file(var.public_key)
  }

  source_image_reference {
    publisher = var.os_attrs.publisher
    offer     = var.os_attrs.offer
    sku       = var.os_attrs.sku
    version   = var.os_attrs.version
  }
  tags = local.common_tags
}

resource "azurerm_availability_set" "avset" {
  name                         = var.linux_avs_name
  location                     = var.location
  resource_group_name          = var.res_grp
  platform_update_domain_count = var.linux_avs_attrs.platform_update_domain_count
  platform_fault_domain_count  = var.linux_avs_attrs.platform_fault_domain_count
  tags                         = local.common_tags
}

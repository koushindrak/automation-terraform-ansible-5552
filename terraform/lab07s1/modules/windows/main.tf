resource "azurerm_public_ip" "window_public_ip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.res_grp
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = each.key
  tags                = local.common_tags
}

resource "azurerm_network_interface" "window_net_interface" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.res_grp

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.sn_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.window_public_ip[each.key].id
  }
  depends_on = [azurerm_public_ip.window_public_ip]
  tags       = local.common_tags
}

resource "azurerm_windows_virtual_machine" "window_vm" {
  for_each              = var.windows_name
  name                  = each.key
  computer_name         = each.key
  location              = var.location
  resource_group_name   = var.res_grp
  network_interface_ids = [azurerm_network_interface.window_net_interface[each.key].id]
  size                  = each.value
  admin_username        = var.win_admin_un
  admin_password        = var.win_pwd
  availability_set_id   = azurerm_availability_set.window_availablity_set.id
  depends_on            = [azurerm_availability_set.window_availablity_set]

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.win_disk_attrs.caching
    storage_account_type = var.win_disk_attrs.type
    disk_size_gb         = var.win_disk_attrs.size
  }


  source_image_reference {
    publisher = var.win_os_attrs.publisher
    offer     = var.win_os_attrs.offer
    sku       = var.win_os_attrs.sku
    version   = var.win_os_attrs.version
  }

  winrm_listener {
    protocol = "Http"
  }
  tags = local.common_tags


}

resource "azurerm_availability_set" "window_availablity_set" {
  name                         = var.windows_avs_name
  location                     = var.location
  resource_group_name          = var.res_grp
  platform_update_domain_count = var.win_avs_attrs.platform_update_domain_count
  platform_fault_domain_count  = var.win_avs_attrs.platform_fault_domain_count
  tags                         = local.common_tags
}

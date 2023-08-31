resource "azurerm_managed_disk" "linux_disk_config" {
  count                = length(var.linux_machine_name)
  name                 = "${var.linux_machine_name[count.index]}-data-disk"
  resource_group_name  = var.resource_group.name
  location             = var.resource_group.location
  storage_account_type = var.linux_disk_props.storage_account_type
  disk_size_gb         = var.linux_disk_props.disk_size_gb
  create_option        = var.linux_disk_props.create_option
  tags                 = local.common_tags
  zone = tostring(count.index + 1)
}

resource "azurerm_virtual_machine_data_disk_attachment" "linux_data_disk_attachment" {
  count              = length(var.linux_machine_name)
  virtual_machine_id = var.linux_machine_id[count.index]
  managed_disk_id    = azurerm_managed_disk.linux_disk_config[count.index].id
  lun                = 0
  caching            = var.linux_disk_props.caching
  depends_on         = [azurerm_managed_disk.linux_disk_config]
}

resource "azurerm_managed_disk" "win_disk_config" {
  count                = length(var.win_machine_name)
  name                 = "${var.win_machine_name[count.index]}-datadisk"
  resource_group_name  = var.resource_group.name
  location             = var.resource_group.location
  storage_account_type = var.win_disk_props.storage_account_type
  disk_size_gb         = var.win_disk_props.disk_size_gb
  create_option        = var.win_disk_props.create_option
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_data_disk_attachment" {
  count              = length(var.win_machine_name)
  virtual_machine_id = var.win_machine_id[count.index]
  managed_disk_id    = azurerm_managed_disk.win_disk_config[count.index].id
  lun                = 0
  caching            = var.win_disk_props.caching
  depends_on         = [azurerm_managed_disk.win_disk_config]
}

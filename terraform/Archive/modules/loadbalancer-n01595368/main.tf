resource "azurerm_public_ip" "lbpip" {
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.lbpip_att.sku
  allocation_method   = var.lbpip_att.allocation_method
  domain_name_label   = var.pip_name
  tags                = local.common_tags
}

resource "azurerm_lb" "linuxlb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.lb_sku
  frontend_ip_configuration {
    name                 = "PublicIP"
    public_ip_address_id = azurerm_public_ip.lbpip.id
  }
  tags = local.common_tags
}

resource "azurerm_lb_backend_address_pool" "lbpool" {
  loadbalancer_id = azurerm_lb.linuxlb.id
  name            = var.pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "linuxasso" {
  count                   = length(var.nic_ids)
  network_interface_id    = var.nic_ids[count.index]
  ip_configuration_name   = var.ipconfigs[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.lbpool.id
}
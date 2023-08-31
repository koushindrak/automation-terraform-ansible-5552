resource "azurerm_lb" "load_balancer" {
  name                = var.load_balancer_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = var.lb_sku
  frontend_ip_configuration {
    name                 = "PublicIP"
    public_ip_address_id = azurerm_public_ip.load_balancer_public_ip.id
  }
  tags = local.common_tags
}


resource "azurerm_public_ip" "load_balancer_public_ip" {
  name                = var.public_ip_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = var.loab_balancer_public_ip_props.sku
  allocation_method   = var.loab_balancer_public_ip_props.allocation_method
  domain_name_label   = var.public_ip_name
  tags                = local.common_tags
}


resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = var.pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_backend_address_pool_association" {
  count                   = length(var.nic)
  network_interface_id    = var.nic[count.index]
  ip_configuration_name   = var.ip_configs[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_address_pool.id
}
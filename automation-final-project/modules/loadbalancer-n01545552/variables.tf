variable "resource_group" {
  type = map(string)
  default = {
    name     = ""
    location = ""
  }
}
variable "public_ip_name" {}
variable "loab_balancer_public_ip_props" {
  type = map(any)
  default = {
    sku               = "Standard"
    allocation_method = "Static"
  }
}
variable "load_balancer_name" {}
variable "pool_name" {}
variable "diagnostic_name" {}
variable "workspace_id" {}
variable "nic" {}
variable "ip_configs" {}
variable "lb_sku" {
  default = "Standard"
}
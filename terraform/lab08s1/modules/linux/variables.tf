variable "res_grp" {}

variable "location" {}

variable "sn_id" {}

variable "vm_name" {}

variable "vm_size" {}

variable "admin_un" {
  default = "n01545552"
}
variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}
variable "private_key" {
  default = "~/.ssh/id_rsa"
}
variable "disk_attrs" {
  type = map(any)
  default = {
    type    = "Premium_LRS"
    size    = 32
    caching = "ReadWrite"
  }
}
variable "os_attrs" {
  type = map(any)
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}
variable "linux_avs_attrs" {
  type = map(any)
  default = {
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "2"
  }
}
variable "linux_avs_name" {}

variable "nb_count" {}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Linux"
    ContactEmail = "n01545552@humber.ca"
    Environment  = "Lab"
  }
}

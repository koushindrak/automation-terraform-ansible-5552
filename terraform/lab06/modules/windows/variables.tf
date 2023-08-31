variable "res_grp" {}

variable "location" {}

variable sn_id {}

variable "win_admin_un" {
  default = "n01545552"
}
variable "win_pwd" {
  default = "n01545552!"
}
variable "win_disk_attrs" {
  type = map(any)
  default = {
    type    = "StandardSSD_LRS"
    size    = 128
    caching = "ReadWrite"
  }
}
variable "win_os_attrs" {
  type = map(any)
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
variable "win_avs_attrs" {
  type = map(any)
  default = {
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "2"
  }
}
variable "windows_avs_name" {}

variable "windows_name" {}

locals {
  common_tags = {
    Name         = "Terraform_Windows"
    Project      = "Windows"
    ContactEmail = "n01545552@humber.ca"
    Environment  = "Lab"
  }
}
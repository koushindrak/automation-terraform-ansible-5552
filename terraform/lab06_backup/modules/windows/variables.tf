variable "res_grp" {}
variable "location" {}
variable sn_id {}
variable "winadminusername" {
  default = "n01545552"
}
variable "winpassword" {
  default = "n01545552!"
}
variable "windisk_attributes" {
  type = map(any)
  default = {
    type    = "StandardSSD_LRS"
    size    = 128
    caching = "ReadWrite"
  }
}
variable "winOS_attribute" {
  type = map(any)
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
variable "windows_avs_att" {
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
    Name         = "Terraform-Class"
    Project      = "Windows"
    ContactEmail = "n01545552@humber.ca"
    Environment  = "Lab"
  }
}
variable "resource_group" {
  type = map(string)
  default = {
    name     = ""
    location = ""
  }
}
variable "subnet1_id" {}

variable "storage_acc_uri" {}

variable "nb_count" {}
variable "win_vm_name" {}

variable "win_public_ip_properties" {
  type = map(any)
  default = {
    sku               = "Standard"
    allocation_method = "Static"
  }
}
variable "win_private_ip_properties" {
  default = "Dynamic"
}
variable "win_vm_size" {
  default = "Standard_B1ms"
}
variable "win_admin_name" {
  default = "n01545552"
}
variable "win_password" {
  default = "admin@5552"
}
variable "win_disk_properties" {
  type = map(any)
  default = {
    type    = "StandardSSD_LRS"
    caching = "ReadWrite"
    size    = 128
  }
}
variable "win_os_properties" {
  type = map(any)
  default = {
    publisher = "MicrosoftWindowsServer"
    sku       = "2016-Datacenter"
    offer     = "WindowsServer"
    version   = "latest"
  }
}
variable "win_avs_name" {}

variable "windows_avs_properties" {
  type = map(any)
  default = {
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "2"
  }
}
variable "ext1" {
  type = map(any)
  default = {
    publisher            = "Microsoft.Azure.Security"
    type_handler_version = "1.3"
    type                 = "IaaSAntimalware"
    auto_upgrade_minor_version = true
  }
}



variable "private_id_rsa_key" {
  default = "~/.ssh/id_rsa"
}

variable "public_id_rsa_key" {
  default = "~/.ssh/id_rsa.pub"
}

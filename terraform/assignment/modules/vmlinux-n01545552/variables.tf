variable "resource_group" {
  type = map(string)
  default = {
    name     = ""
    location = ""
  }
}
variable "subnet_id" {}

variable "storage_acc_uri" {}

variable "public_ip_properties" {
  type = map(any)
  default = {
    sku               = "Standard"
    allocation_method = "Static"
  }
}

variable "private_ip_props" {
  default = "Dynamic"
}

variable "private_id_rsa_key" {
  default = "~/.ssh/id_rsa"
}

variable "public_id_rsa_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "admin_name" {
  default = "n01545552"
}

variable "linux_vm_names_zones" {
  type = map(any)
  default = {
    n01545552-u-vm1 = "1"
    n01545552-u-vm2 = "2"
    n01545552-u-vm3 = "3"
  }
}

variable "machine_size" {
  default = "Standard_B1ms"
}
variable "linux_machine_config" {
  type = map(any)
  default = {
    publisher = "OpenLogic"
    sku       = "8_2"
    offer     = "CentOS"
    version   = "latest"
  }
}

variable "linux_disk_attributes" {
  type = map(any)
  default = {
    disk_type = "Standard_LRS"
    caching   = "ReadWrite"
    size      = 32
  }
}

variable "ext1" {
  type = map(any)
  default = {
    publisher                  = "Microsoft.Azure.NetworkWatcher"
    type                       = "NetworkWatcherAgentLinux"
    type_handler_version       = "1.0"
    auto_upgrade_minor_version = "true"
  }
}

variable "ext2" {
  type = map(any)
  default = {
    publisher            = "Microsoft.Azure.Monitor"
    type                 = "AzureMonitorLinuxAgent"
    type_handler_version = "1.0"
    auto_upgrade_minor_version = "true"
  }
}


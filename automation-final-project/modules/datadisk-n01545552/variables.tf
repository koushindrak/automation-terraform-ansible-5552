variable "resource_group" {
  type = map(string)
  default = {
    name     = ""
    location = ""
  }
}


variable "linux_machine_name" {}
variable "linux_machine_id" {}

variable "linux_disk_props" {
  type = map(any)
  default = {
    disk_size_gb         = 10
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    create_option        = "Empty"
  }
}


variable "resource_group" {
  type = map(string)
  default = {
    name     = ""
    location = ""
  }
}

variable "storage_attributes" {
  type = map(any)
  default = {
    tier        = "Standard"
    replication = "LRS"
  }
}
variable "storage_name" {}

variable "vault_attributes" {
  type = map(any)
  default = {
    sku = "Standard"
  }
}
variable "vault_name" {}

variable "workspace_attributes" {
  type = map(any)
  default = {
    sku       = "PerGB2018"
    retention = "30"
  }
}
variable "workspace_name" {}



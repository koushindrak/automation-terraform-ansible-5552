variable "resource_group" {
  type = map(string)
  default = {
    name     = ""
    location = ""
  }
}

variable "vnet1_name" {}

variable "vnet1_space" {}

variable "subnet1_name" {}

variable "subnet1_space" {}

variable "nsg1_name" {}
locals {
  Name         = "Terraform-Class"
  Project      = "Learning"
  ContactEmail = "n01545552@humber.ca"
  Environment  = "Lab"
}

variable "server_name" {
  default = "n01545552-u-vm1"
}
variable "server_size" {
  default = "Standard_B1s"
}
variable "un" {
  default = "n01545552"
}
variable "publickey" {
  default = "~/.ssh/id_rsa.pub"
}
variable "disk_type" {
  default = "Premium_LRS"
}
variable "disk_size" {
  default = 32
}
variable "disk_caching" {
  default = "ReadWrite"
}
variable "publisher" {
  default = "Canonical"
}
variable "offer" {
  default = "UbuntuServer"
}
variable "sku" {
  default = "18.04-LTS"
}
variable "os_version" {
  default = "latest"
}
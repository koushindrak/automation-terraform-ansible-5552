variable "resource-grp" {
  default = "network-rg"
}
variable "net" {
  default = "network-vnet"
}
variable "loc" {
  default = "canadacentral"
}
variable "subnet1" {
  default = "network-subnet1"
}
variable "subnet2" {
  default = "network-subnet2"
}
variable "vn-space" {
  default = ["10.0.0.0/16"]
}
variable "sub1-space" {
  default = ["10.0.0.0/24"]
}
variable "sub2-space" {
  default = ["10.0.1.0/24"]
}
variable "nsg1" {
  default = "network-nsg1"
}
variable "nsg2" {
  default = "network-nsg2"
}
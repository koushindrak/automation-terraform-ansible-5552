variable "windows_avs" {
  default = "window_avail_set"
}
variable "window_count" {
  default = 2
}
variable "windows_name" {
  type = map(string)
  default = {
    "n01545552-w-vm1" = "Standard_B1s"
    "n01545552-w-vm2" = "Standard_B1ms"
  }
}
variable "win_admin_name" {
  default = "n01545552"
}
variable "win_publickey" {
  default = "~/.ssh/id_rsa.pub"
}
variable "win_disk_type" {
  default = "StandardSSD_LRS"
}
variable "win_disk_size" {
  default = 128
}
variable "win_disk_caching" {
  default = "ReadWrite"
}
variable "win_publisher" {
  default = "MicrosoftWindowsServer"
}
variable "win_offer" {
  default = "WindowsServer"
}
variable "win_sku" {
  default = "2016-Datacenter"
}
variable "win_os_version" {
  default = "latest"
}
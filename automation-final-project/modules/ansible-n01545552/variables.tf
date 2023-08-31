variable "linux_machine_full_name" {}

variable "linux_variables" {
  default = {
    ssh_user       = "n01545552"
    ssh_privatekey = "~/.ssh/id_rsa"
  }
}
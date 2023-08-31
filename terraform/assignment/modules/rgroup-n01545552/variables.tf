variable "resource_group" {
  type = map(string)
  default = {
    name     = ""
    location = ""
  }
}

variable "resource_group" {
  type = map(string)
  default = {
    name     = ""
    location = ""
  }
}
variable "database_server_name" {}
variable "database_server_config" {
  type = map(any)
  default = {
    sku_name                     = "B_Gen5_1"
    storage_mb                   = 10240
    backup_retention_days        = 14
    geo_redundant_backup_enabled = false
    auto_grow_enabled            = false
    administrator_login          = "koushindra"
    administrator_login_password = "admin@5552"
    version                      = "11"
    ssl_enforcement_enabled      = true
  }
}
variable "database_name" {}
variable "database_props" {
  type = map(any)
  default = {
    charset   = "UTF8"
    collation = "English_United States.1252"
  }
}
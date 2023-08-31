module "rgroup-n01595368" {
  source   = "./modules/rgroup-n01595368"
  rg_name  = "n01595368-RG"
  location = "canadacentral"
}

module "network-n01595368" {
  source        = "./modules/network-n01595368"
  location      = module.rgroup-n01595368.rg_location
  rg_name       = module.rgroup-n01595368.rg_name
  vnet1_name    = "n01595368-VNET"
  vnet1_space   = ["10.0.0.0/16"]
  subnet1       = "n01595368-SUBNET"
  subnet1_space = ["10.0.0.0/24"]
  nsg1          = "n01595368-NSG"
}

module "common-n01595368" {
  source         = "./modules/common-n01595368"
  location       = module.rgroup-n01595368.rg_location
  rg_name        = module.rgroup-n01595368.rg_name
  storage_name   = "5368storage"
  workspace_name = "5368workspace"
  vault_name     = "recoveryvault5368"
}

module "vmlinux-n01595368" {
  source                   = "./modules/vmlinux-n01595368"
  location                 = module.rgroup-n01595368.rg_location
  rg_name                  = module.rgroup-n01595368.rg_name
  subnet_id                = module.network-n01595368.subnet1_ID
  storage_account_endpoint = module.common-n01595368.storage_account_endpoint
}

module "vmwindows-n01595368" {
  source                   = "./modules/vmwindows-n01595368"
  location                 = module.rgroup-n01595368.rg_location
  rg_name                  = module.rgroup-n01595368.rg_name
  subnet_id                = module.network-n01595368.subnet1_ID
  storage_account_endpoint = module.common-n01595368.storage_account_endpoint
  nb_count                 = "1"
  windows_avs_name         = "windows_avset"
  vmname                   = "n01595368-w-vm"
}

module "datadisk-n01595368" {
  source          = "./modules/datadisk-n01595368"
  location        = module.rgroup-n01595368.rg_location
  rg_name         = module.rgroup-n01595368.rg_name
  linux_vm_name   = module.vmlinux-n01595368.linux_vm_name
  linux_vm_id     = module.vmlinux-n01595368.linux_vm_id
  windows_vm_name = module.vmwindows-n01595368.windows_vm_name
  windows_vm_id   = module.vmwindows-n01595368.windows_vm_id
}

module "loadbalancer-n01595368" {
  source          = "./modules/loadbalancer-n01595368"
  location        = module.rgroup-n01595368.rg_location
  rg_name         = module.rgroup-n01595368.rg_name
  pip_name        = "linuxlb-5368-pip"
  lb_name         = "LinuxLoadBalancer5368"
  pool_name       = "LinuxPool5368"
  nic_ids         = module.vmlinux-n01595368.linux_vm_nic_id
  ipconfigs       = module.vmlinux-n01595368.linux_vm_ipconfig_name
}

module "database-n01595368" {
  source        = "./modules/database-n01595368"
  location      = module.rgroup-n01595368.rg_location
  rg_name       = module.rgroup-n01595368.rg_name
  dbserver_name = "psqlserver5368"
  db_name       = "psqldb5368"
}

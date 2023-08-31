module "rgroup-n01545552" {
  source                  = "./modules/rgroup-n01545552"
  resource_group = {
    name     = "n01545552-RG"
    location = "canadacentral"
  }
}

module "network-n01545552" {
  source                  = "./modules/network-n01545552"
  resource_group = {
    name     = module.rgroup-n01545552.resource_group_name
    location = module.rgroup-n01545552.resource_group_location
  }
  vnet1_name              = "n01545552-VNET"
  vnet1_space             = ["10.0.0.0/16"]
  subnet1_name            = "n01545552-SUBNET"
  subnet1_space           = ["10.0.0.0/24"]
  nsg1_name               = "n01545552-NSG"
}

module "common-n01545552" {
  source = "./modules/common-n01545552"
  resource_group = {
    name     = module.rgroup-n01545552.resource_group_name
    location = module.rgroup-n01545552.resource_group_location
  }
  storage_name   = "5552storage"
  workspace_name = "5552workspace"
  vault_name     = "vault5552"
}

module "vmlinux-n01545552" {
  source = "./modules/vmlinux-n01545552"
  resource_group = {
    name     = module.rgroup-n01545552.resource_group_name
    location = module.rgroup-n01545552.resource_group_location
  }
  subnet_id       = module.network-n01545552.subnet_id
  storage_acc_uri = module.common-n01545552.storage_account_uri
}

module "vmwindows-n01545552" {
  source = "./modules/vmwindows-n01545552"
  resource_group = {
    name     = module.rgroup-n01545552.resource_group_name
    location = module.rgroup-n01545552.resource_group_location
  }
  subnet1_id      = module.network-n01545552.subnet_id
  storage_acc_uri = module.common-n01545552.storage_account_uri
  nb_count        = "1"
  win_avs_name    = "win_availability_set"
  win_vm_name     = "n01545552-w-vm"
}

module "datadisk-n01545552" {
  source = "./modules/datadisk-n01545552"
  resource_group = {
    name     = module.rgroup-n01545552.resource_group_name
    location = module.rgroup-n01545552.resource_group_location
  }
  win_machine_name   = module.vmwindows-n01545552.win_machine_name
  win_machine_id     = module.vmwindows-n01545552.win_machine_id
  linux_machine_name = module.vmlinux-n01545552.linux_machine_name
  linux_machine_id   = module.vmlinux-n01545552.linux_machine_id
}


module "loadbalancer-n01545552" {
  source = "./modules/loadbalancer-n01545552"
  resource_group = {
    name     = module.rgroup-n01545552.resource_group_name
    location = module.rgroup-n01545552.resource_group_location
  }
  ip_configs         = module.vmlinux-n01545552.linux_ip_configs
  load_balancer_name = "load-balancer-5552"
  public_ip_name     = "load-balancer-5552-public-ip"
  nic                = module.vmlinux-n01545552.linux_nic_id
  pool_name          = "pool-5552"
}

module "database-n01545552" {
  source = "./modules/database-n01545552"
  resource_group = {
    name     = module.rgroup-n01545552.resource_group_name
    location = module.rgroup-n01545552.resource_group_location
  }
  database_server_name = "postgresql-server-5552"
  database_name        = "postgresql-db-5552"
}

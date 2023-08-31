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


module "datadisk-n01545552" {
  source = "./modules/datadisk-n01545552"
  resource_group = {
    name     = module.rgroup-n01545552.resource_group_name
    location = module.rgroup-n01545552.resource_group_location
  }
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
  diagnostic_name = "LoadBalancer"
  workspace_id    = module.common-n01545552.workspace_id
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

module "ansible-n01545552" {
  source        = "./modules/ansible-n01545552"
  linux_machine_full_name = module.vmlinux-n01545552.linux_machine_full_domain_name
  linux_variables = {
    ssh_user       = "n01545552"
    ssh_privatekey = "~/.ssh/id_rsa"
  }
  depends_on = [module.datadisk-n01545552, module.vmlinux-n01545552]
}
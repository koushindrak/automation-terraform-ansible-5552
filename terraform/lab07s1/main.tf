module "resource_group" {
  source          = "./modules/resource_group"
  network_res_grp = "Network-Resource-Group"
  linux_res_grp   = "Linux-Resource-Group"
  windows_res_grp = "Windows-Resource-Group"
  location        = "canadacentral"
}

module "network" {
  source             = "./modules/network"
  location           = module.resource_group.net_res_grp_location
  res_grp            = module.resource_group.net_res_grp_name
  virtual_net_name   = "network-vnet"
  virtual_net_space  = ["10.0.0.0/16"]
  first_subnet       = "network-subnet1"
  first_subnet_space = ["10.0.0.0/24"]
  second_subnet      = "network-subnet2"
  sec_subnet_space   = ["10.0.1.0/24"]
  first_nsg          = "network-first_nsg"
  second_nsg         = "network-second_nsg"
}

module "linux" {
  source         = "./modules/linux"
  location       = module.resource_group.linux_res_grp_location
  res_grp        = module.resource_group.linux_res_grp_name
  sn_id          = module.network.first_subnet_id
  vm_name        = "n01545552-c-vm"
  vm_size        = "Standard_B1s"
  linux_avs_name = "linux_av_set"
  nb_count       = 2
}


module "windows" {
  source   = "./modules/windows"
  location = module.resource_group.windows_res_grp_location
  res_grp  = module.resource_group.windows_res_grp_name
  sn_id    = module.network.second_subnet_id
  windows_name = {
    n01545552-w-vm1 = "Standard_B1s"
  }
  windows_avs_name = "windows_avset"
}
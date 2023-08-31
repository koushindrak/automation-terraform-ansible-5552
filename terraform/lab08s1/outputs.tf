output "RESOURCE_GROUP_NAMES" {
  value = [
    module.resource_group.net_res_grp_name,
    module.resource_group.linux_res_grp_name,
    module.resource_group.windows_res_grp_name
  ]
}


output "virtual_net_name" {
  value = module.network.virtual_net_name
}
output "virtual_net_space" {
  value = module.network.virtual_net_space[0]
}

output "first_subnet_name" {
  value = module.network.first_subnet_name
}
output "first_subnet_space" {
  value = module.network.first_subnet_space[0]
}
output "first_nsg_name" {
  value = module.network.first_nsg_name
}

output "second_subnet_name" {
  value = module.network.second_subnet_name
}
output "second_subnet_space" {
  value = module.network.second_subnet_space[0]
}
output "second_nsg_name" {
  value = module.network.second_nsg_name
}

output "linux_vm_name" {
  value = module.linux.linux_vm_name
}
output "linux_vm_fqdn" {
  value = module.linux.linux_vm_fqdn
}
output "linux_vm_private_ip" {
  value = module.linux.linux_vm_private_ip
}
output "linux_vm_public_ip" {
  value = module.linux.linux_vm_public_ip
}
output "linux_avs_set" {
  value = module.linux.linux_avs_set
}

output "WINDOW_VM_NAME" {
  value = module.windows.WINDOW_VM_NAME
}
output "WINDOW_VM_FQDN" {
  value = module.windows.WINDOW_VM_FQDN
}
output "WINDOW_VM_PRIVATE_IP" {
  value = module.windows.WINDOW_VM_PRIVATE_IP
}
output "WINDOW_VM_PUBLIC_IP" {
  value = module.windows.WINDOW_VM_PUBLIC_IP
}
output "WINDOW_AVAIL_SET" {
  value = module.windows.WINDOW_AVAIL_SET
}

#Resource group module
output "resource_group_name" {
  value = module.rgroup-n01545552.resource_group_name
}

#Network module
output "vnet_name" {
  value = module.network-n01545552.vnet_name
}

output "subnet_name" {
  value = module.network-n01545552.subnet_name
}

#Common Module
output "storage_account_name" {
  value = module.common-n01545552.azure_storage_account_name
}

output "analytics_workspace_name" {
  value = module.common-n01545552.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common-n01545552.recovery_services_vault_name
}

#Linux Module
output "linux_vm_name" {
  value = module.vmlinux-n01545552.linux_machine_name
}
output "linux_vm_fqdn" {
  value = module.vmlinux-n01545552.linux_machine_full_domain_name
}
output "linux_vm_privateIP" {
  value = module.vmlinux-n01545552.linux_machine_private_ip
}
output "linux_vm_publicIP" {
  value = module.vmlinux-n01545552.linux_machine_public_ip
}

#Windows Module
output "windows_vm_name" {
  value = module.vmwindows-n01545552.win_machine_name
}
output "windows_vm_fqdn" {
  value = module.vmwindows-n01545552.win_machine_fqdn
}
output "windows_vm_publicIP" {
  value = module.vmwindows-n01545552.win_machine_public_ip
}
output "windows_vm_privateIP" {
  value = module.vmwindows-n01545552.win_machine_private_ip
}

#Data Disk Module
output "linux_disk_name" {
  value = module.datadisk-n01545552.linux_disk_name
}
output "windows_disk_name" {
  value = module.datadisk-n01545552.windows_disk_name
}

#Load Balancer Module
output "load_balancer_name" {
  value = module.loadbalancer-n01545552.load_balancer_name
}

#Database Module
output "db_server_name" {
  value     = module.database-n01545552.postgresql_server_name
}
output "db_name" {
  value = module.database-n01545552.postgresql_database_name
}
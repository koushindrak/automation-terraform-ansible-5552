output "rg_name" {
  value = [
    module.rgroup-n01545552.rg_name
  ]
}
output "vnet_name" {
  value = module.network-n01545552.vnet1_name
}
output "vnet_space" {
  value = module.network-n01545552.vnet1_space[0]
}
output "subnet1_name" {
  value = module.network-n01545552.subnet1_name
}
output "subnet1_space" {
  value = module.network-n01545552.subnet1_space[0]
}
output "nsg1_name" {
  value = module.network-n01545552.nsg1_name
}
output "storage_name" {
  value = module.common-n01545552.storage_name
}
output "workspace_name" {
  value = module.common-n01545552.workspace_name
}
output "vault_name" {
  value = module.common-n01545552.vault_name
}
output "linux_vm_name" {
  value = module.vmlinux-n01545552.linux_vm_name
}
output "linux_vm_fqdn" {
  value = module.vmlinux-n01545552.linux_vm_fqdn
}
output "linux_vm_privateIP" {
  value = module.vmlinux-n01545552.linux_vm_privateIP
}
output "linux_vm_publicIP" {
  value = module.vmlinux-n01545552.linux_vm_publicIP
}
output "windows_vm_name" {
  value = module.vmwindows-n01545552.windows_vm_name
}
output "windows_vm_fqdn" {
  value = module.vmwindows-n01545552.windows_vm_fqdn
}
output "windows_vm_privateIP" {
  value = module.vmwindows-n01545552.windows_vm_privateIP
}
output "windows_vm_publicIP" {
  value = module.vmwindows-n01545552.windows_vm_publicIP
}
output "windows_avset" {
  value = module.vmwindows-n01545552.windows_avset
}
output "linux_datadisks_name" {
  value = module.datadisk-n01545552.linuxdisks_name
}
output "windows_datadisks_name" {
  value = module.datadisk-n01545552.windisks_name
}
output "loadbalancer_name" {
  value = module.loadbalancer-n01545552.lb_name
}
output "dbserver_name" {
  value     = module.database-n01545552.dbserver_name
  sensitive = true
}
output "db_name" {
  value = module.database-n01545552.db_name
}

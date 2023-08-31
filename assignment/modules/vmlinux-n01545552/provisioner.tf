resource "null_resource" "linux_provisioner" {
  for_each              = var.linux_vm_names_zones
  depends_on = [azurerm_linux_virtual_machine.virtual_machine]

  provisioner "remote-exec" {
    inline = [
      "echo `hostname`"
    ]

    connection {
      type        = "ssh"
      user        = var.admin_name
      private_key = file(var.private_id_rsa_key)
      host        = azurerm_public_ip.public_ip[each.key].fqdn
    }

  }
}
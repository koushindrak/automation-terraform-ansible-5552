resource "null_resource" "provisioner" {
  count = var.nb_count

  depends_on = [azurerm_linux_virtual_machine.virtual_machine]

  provisioner "remote-exec" {
    inline = ["echo 'Hostname: ' $(hostname)"]

    connection {
      type        = "ssh"
      user        = var.un
      private_key = file("~/.ssh/id_rsa")
      host        = azurerm_linux_virtual_machine.virtual_machine[count.index].public_ip_address
    }
  }
}

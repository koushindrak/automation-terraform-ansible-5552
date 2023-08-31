resource "local_file" "inventory" {
  filename = "ansible/hosts"
  content  = <<-EOF
    [linux]
    ${join("\n", var.linux_machine_full_name)}

    [linux:vars]
    ansible_ssh_user = ${var.linux_variables.ssh_user}
    ansible_ssh_private_key_file= ${var.linux_variables.ssh_privatekey}
    EOF
}



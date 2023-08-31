resource "null_resource" "ansible_provisioner" {

  provisioner "local-exec" {
    command = "cd ansible && ansible-playbook playbook_n01545552.yml"
  }

}
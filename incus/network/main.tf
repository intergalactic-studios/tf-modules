resource "incus_network" "network" {
  name = var.name
  type = var.type
  description = var.description
  config = var.config
}


resource "null_resource" "test_script" {
  # Runs when you apply Terraform
  provisioner "local-exec" {
    command = "echo 'Hello, Terraform!' > /home/intergalactic/testfile.txt"
  }

  # Runs when you destroy Terraform
  provisioner "local-exec" {
    when    = destroy
    command = "rm -f /tmp/testfile.txt"
  }
}

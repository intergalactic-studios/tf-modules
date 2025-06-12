resource "vultr_ssh_key" "my_ssh_key" {
  name = var.name
  ssh_key = var.ssh_key
}
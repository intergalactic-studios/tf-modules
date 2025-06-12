resource "vultr_ssh_key" "this" {
  name = var.name
  ssh_key = var.ssh_key
}
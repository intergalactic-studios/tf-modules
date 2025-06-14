resource "incus_network" "network" {
  name = var.name
  type = var.type
  description = var.description
  config = var.config

  provisioner "local-exec" {
    command = "ip link set ${var.name} up || true"
  }
}
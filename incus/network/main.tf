resource "incus_network" "network" {
  name = var.name
  type = var.type
  description = var.description
  config = var.config
}
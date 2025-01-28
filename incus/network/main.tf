resource "incus_network" "new_default" {
  name = var.name
  type = var.type
  description = var.description
  config = var.config
}
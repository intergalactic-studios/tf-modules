resource "incus_network" "incusbr0" {
  name = var.name
  type = var.type
  description = var.description
  config = var.config

}
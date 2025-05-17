resource "incus_profile" "profile" {
  name = var.name
  description = var.description
  config = var.config
  device = var.device
}
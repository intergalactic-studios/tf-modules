resource "incus_profile" "profile" {
  name = var.name
  config = var.config
  device = var.device
}

resource "incus_storage_pool" "pool" {
  name   = var.name
  driver = var.driver
  config = var.config
}
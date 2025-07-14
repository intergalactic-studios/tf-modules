resource "incus_storage_pool" "pool" {
  name   = var.name
  driver = var.driver
  config = var.config
  
  lifecycle {
    ignore_changes = [ config["source"] ]
  }
}
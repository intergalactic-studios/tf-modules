resource "incus_storage_volume" "volume" {
  name         = var.name
  description  = var.description
  pool         = var.pool
  type         = var.type
  content_type = var.content_type
  config       = var.config
}


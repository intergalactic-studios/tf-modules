resource "digitalocean_spaces_bucket" "space" {
  name   = var.name
  region = var.region
  acl = var.acl
}

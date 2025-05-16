resource "digitalocean_droplet" "droplet" {
  image      = var.image
  name       = var.name
  region     = var.region
  size       = var.size
  backups    = var.backups
  monitoring = var.monitoring
  ipv6       = var.ipv6
  ssh_keys   = var.ssh_keys
  user_data  = var.user_data
  vpc_uuid   = var.vpc_uuid
  tags       = var.tags
}

output "droplet_id" {
  description = "The ID of the Droplet"
  value       = digitalocean_droplet.droplet.id
}

output "droplet_name" {
  description = "The name of the Droplet"
  value       = digitalocean_droplet.droplet.name
}

output "droplet_ipv4_address" {
  description = "The public IPv4 address of the Droplet"
  value       = digitalocean_droplet.droplet.ipv4_address
}

output "droplet_ipv6_address" {
  description = "The public IPv6 address of the Droplet"
  value       = digitalocean_droplet.droplet.ipv6_address
}

output "droplet_status" {
  description = "The status of the Droplet"
  value       = digitalocean_droplet.droplet.status
}

output "droplet_tags" {
  description = "The tags applied to the Droplet"
  value       = digitalocean_droplet.droplet.tags
}
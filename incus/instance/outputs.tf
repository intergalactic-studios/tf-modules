output "instance_name" {
  description = "Name of the Incus instance"
  value       = incus_instance.uptime_kuma.name
}

output "instance_ip" {
  description = "IP address of the Incus instance"
  value       = incus_instance.uptime_kuma.ipv4_address
}

output "uptime_kuma_url" {
  description = "URL to access Uptime Kuma"
  value       = "http://${incus_instance.uptime_kuma.ipv4_address}:${var.port}"
}
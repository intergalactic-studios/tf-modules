output "instance_name" {
  description = "Name of the Incus instance"
  value       = incus_instance.instance.name
}

output "instance_ip" {
  description = "IP address of the Incus instance"
  value       = incus_instance.instance.ipv4_address
}

output "app_url" {
  description = "URL to access Uptime Kuma"
  value       = "http://${incus_instance.instance.ipv4_address}:${var.port}"
}
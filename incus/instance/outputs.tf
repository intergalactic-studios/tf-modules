output "instance_name" {
  value       = incus_instance.this.name
  description = "Instance name"
}

output "ipv4_address" {
  value       = try(incus_instance.this.ipv4_address, "")
  description = "Primary IPv4 address"
}

output "connection_info" {
  value = {
    name = incus_instance.this.name
    type = incus_instance.this.type
    ip   = try(incus_instance.this.ipv4_address, "")
  }
  description = "Connection details for Ansible"
}
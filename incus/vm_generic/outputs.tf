output "vm_name" {
  value = incus_instance.this.name
}

output "config" {
  value = incus_instance.this.config
}

output "vm_name" {
  value = incus_instance.this.name
}

output "addresses" {
  value = incus_instance.this.addresses
}

output "config" {
  value = incus_instance.this.config
}

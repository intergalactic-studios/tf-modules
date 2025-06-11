output "vm_name" { 
  value = incus_instance.this.name 
}
output "ip_address" {
  value = incus_instance.this.addresses
}

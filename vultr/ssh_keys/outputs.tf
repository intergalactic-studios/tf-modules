output "name" {
  description = "The name of the SSH key."
  value       = vultr_ssh_key.this.name  
}
output "ssh_key" {
  description = "The SSH public key."
  value       = vultr_ssh_key.this.ssh_key
  sensitive = true
}
output "id" {
  description = "The ID of the SSH key."
  value       = vultr_ssh_key.this.id
}
output "date_created" {
  description = "The creation date of the SSH key."
  value       = vultr_ssh_key.this.date_created
}
output "name" {
  description = "The name of the SSH key."
  value       = vultr_ssh_key.my_ssh_key.name  
}
output "ssh_key" {
  description = "The SSH public key."
  value       = vultr_ssh_key.my_ssh_key.ssh_key
}
output "id" {
  description = "The ID of the SSH key."
  value       = vultr_ssh_key.my_ssh_key.id
}
output "date_created" {
  description = "The creation date of the SSH key."
  value       = vultr_ssh_key.my_ssh_key.date_created
}
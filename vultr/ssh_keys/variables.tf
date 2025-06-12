variable "name" {
  description = "The name of the SSH key."
  type        = string  
}
variable "ssh_key" {
  description = "The SSH public key to add."
  type        = string
}
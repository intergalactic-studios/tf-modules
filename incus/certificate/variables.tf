variable "client_name" {
  description = "Name of the client certificate"
  type        = string
}
variable "description" {
  description = "Description of the certificate"
  type        = string  
}
variable "restricted" {
  description = "Whether the certificate is restricted"
  type        = bool
  default     = false
}
variable "type" {
  description = "Type of the certificate"
  type        = string  
}
variable "certificate" {
  description = "Path to the certificate"
  type        = string  
}
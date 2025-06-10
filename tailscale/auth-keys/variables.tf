variable "reusable" {
  description = "Whether the key is reusable"
  type        = bool
}

variable "ephemeral" {
  description = "Whether the key is ephemeral"
  type        = bool
}

variable "preauthorized" {
  description = "Whether the key is preauthorized"
  type        = bool
}

variable "expiry" {
  description = "The expiry time of the key"
  type        = string
  default     = "3600"
}

variable "description" {
  description = "The description of the key"
  type        = string
  default     = "Terraform generated key"
}
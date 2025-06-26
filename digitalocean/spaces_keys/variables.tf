variable "name" {
  description = "The name of the space key"
  type        = string
}

variable "permission" {
  description = "The permission for the space key"
  type        = string
  default     = "read"
  validation {
      condition     = contains(["read", "fullacess", "readwrite"], var.permission)
      error_message = "The permission must be one of 'read', 'fullacess', 'readwrite'."
  }
}
variable "bucket_name" {
  description = "The name of the bucket to which the key will be granted access"
  type        = string
}
variable "name" {
  description = "The name of the storage volume"
  type        = string
  
}

variable "description" {
  description = "The description of the storage volume"
  type        = string
  default     = ""
}

variable "pool" {
  description = "The name of the storage pool"
  type        = string
  
}

variable "type" {
  description = "Optional - The 'type' of volume. The default value is custom, which is the type to use for storage volumes attached to instances."
  type        = string
  default     = "custom"
}

variable "content_type" {
  description = "The content type of the storage volume"
  type        = string
  default     = "custom"
    validation {
        condition     = contains(["filesystem", "block"], var.content_type)
        error_message = "The content type must be one of 'filesystem', 'block'."
    }
}

variable "config" {
  description = "The configuration of the storage volume"
  type        = map(string)
  default     = {}
}

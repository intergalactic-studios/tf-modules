variable "name" {
  description = "Instance name"
  type        = string
}

variable "image" {
  description = "Source image (e.g., 'images:ubuntu/jammy')"
  type        = string
}

variable "type" {
  description = "Instance type (container or virtual-machine)"
  type        = string
  default     = "container"
  validation {
    condition     = contains(["container", "virtual-machine"], var.type)
    error_message = "Must be either 'container' or 'virtual-machine'"
  }
}

variable "profiles" {
  description = "List of profiles to apply"
  type        = list(string)
  default     = ["default"]
}

variable "ephemeral" {
  description = "Whether the instance is ephemeral"
  type        = bool
  default     = false
}

variable "running" {
  description = "Whether to start the instance"
  type        = bool
  default     = true
}

variable "limits" {
  description = "Resource limits"
  type = object({
    cpu    = number
    memory = number
  })
  default = {
    cpu    = 2
    memory = 2048
  }
}

variable "devices" {
  description = "List of devices to attach"
  type = list(object({
    name       = string
    type       = string
    properties = map(string)
  }))
  default = []
}

variable "cloud_init" {
  description = "Cloud-init configuration (raw content)"
  type        = string
  default     = null
}

variable "extra_config" {
  description = "Additional instance configuration"
  type        = map(string)
  default     = {}
}

variable "description" {
  description = "Instance description"
  type        = string
  default     = ""
}
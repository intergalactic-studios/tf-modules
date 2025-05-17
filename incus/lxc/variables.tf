variable "name" {
  description = "Container name"
  type        = string
}

variable "image" {
  description = "Source image (e.g., 'images:ubuntu/jammy')"
  type        = string
}

variable "profiles" {
  description = "List of profiles to apply"
  type        = list(string)
  default     = ["default"]
}

variable "ephemeral" {
  description = "Whether the container is ephemeral"
  type        = bool
  default     = false
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

variable "limits" {
  description = "Resource limits"
  type        = map(string)
  default     = {}
}

variable "cloud_init_file" {
  description = "Cloud-init configuration file name"
  type        = string
  default     = "default.cfg"
}
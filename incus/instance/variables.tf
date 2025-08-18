variable "name" {
  description = "Instance name"
  type        = string
}

variable "image" {
  description = "Instance image"
  type        = string
  default     = "images:ubuntu/22.04"
}

variable "type" {
  description = "Instance type"
  type        = string
  default     = "virtual-machine"
}

variable "profiles" {
  description = "List of profiles"
  type        = list(string)
  default     = ["default"]
}

variable "limits" {
  description = "Resource limits"
  type = object({
    cpu    = optional(string, "2")
    memory = optional(string, "2GiB")
    disk   = optional(string, null)
  })
  default = {}
}

variable "devices" {
  description = "Additional devices"
  type = list(object({
    name       = string
    type       = string
    properties = map(string)
  }))
  default = []
}

variable "cloud_init_config" {
  description = "Cloud-init configuration"
  type        = string
  default     = null
}

variable "extra_config" {
  description = "Extra configuration"
  type        = map(string)
  default     = {}
}
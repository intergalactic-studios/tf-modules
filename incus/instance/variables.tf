# Core Instance Variables
variable "name" {
  type        = string
  description = "Instance name (must be unique)"
}

variable "image" {
  type        = string
  description = "Source image (e.g. 'images:ubuntu/22.04')"
}

variable "type" {
  type        = string
  default     = "container"
  description = "Instance type ('container' or 'virtual-machine')"
}

variable "profiles" {
  type        = list(string)
  default     = ["default"]
  description = "Incus profiles to apply"
}

variable "limits" {
  type = object({
    cpu    = string
    memory = string
    disk   = optional(string)
  })
  default = {
    cpu    = "2"
    memory = "2GiB"
  }
  description = "Resource limits"
}

# Cloud-init (accepts pre-rendered content only)
variable "cloud_init_config" {
  type        = string
  default     = ""
  description = "Pre-rendered cloud-init user-data content"
}

# Additional Options
variable "devices" {
  type = list(object({
    name       = string
    type       = string
    properties = map(string)
  }))
  default     = []
  description = "Additional devices to attach"
}

variable "extra_config" {
  type        = map(string)
  default     = {}
  description = "Additional instance config options"
}

variable "wait_for_network" {
  type        = bool
  default     = true
  description = "Wait until instance has network connectivity"
}
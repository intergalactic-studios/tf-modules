variable "name" {
  description = "The name of the network"
  type        = string
}

variable "devices" {
  description = "List of devices to add to the profile"
  type = list(object({
    name       = string
    type       = string
    properties = map(string)
  }))
  default = []
  validation {
    condition = alltrue([
      for d in var.devices : contains([
        "none", "disk", "nic", "unix-char", "unix-block", 
        "usb", "gpu", "infiniband", "proxy", 
        "unix-hotplug", "tpm", "pci"
      ], d.type)
    ])
    error_message = "Device type must be one of the supported Incus device types"
  }
}

variable "config" {
  description = "The configuration of the network"
  type        = map(string)
  
}

variable "description" {
  description = "The description of the network"
  type        = string
  default     = ""
}
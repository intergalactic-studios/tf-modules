resource "portainer_docker_network" "this" {
  endpoint_id = var.endpoint_id
  name        = var.network_name
  driver      = var.network_driver
  internal    = var.network_internal
  attachable  = var.network_attachable

  dynamic "options" {
    for_each = var.network_options != null ? var.network_options : {}
    content {
      key   = options.key
      value = options.value
    }
    
  }

  dynamic "labels" {
    for_each = var.network_labels != null ? var.network_labels : {}
    content {
      key   = labels.key
      value = labels.value
    }
    
  }
}

variable "endpoint_id" {
  description = "Portainer endpoint ID"
  type        = number
  
}
variable "network_name" {
  description = "Name of the Docker network"
  type        = string
}
variable "network_driver" {
  description = "Network driver type (e.g., bridge, overlay)"
  type        = string
  default     = "bridge"
}
variable "network_internal" {
  description = "Whether the network is internal (no external access)"
  type        = bool
  default     = false
}
variable "network_attachable" {
  description = "Whether the network is attachable by containers"
  type        = bool
  default     = false
}
variable "network_options" {
  description = "Optional network driver options"
  type        = map(string)
  default     = {}
}
variable "network_labels" {
  description = "Optional labels for the network"
  type        = map(string)
  default     = {}
}

output "network_id" {
  description = "ID of the created Docker network"
  value       = portainer_docker_network.this.id
}
output "network_name" {
  description = "Name of the created Docker network"
  value       = portainer_docker_network.this.name
}
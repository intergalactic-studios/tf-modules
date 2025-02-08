variable "instance_name" {
  description = "Name of the Incus instance"
  type        = string
}

variable "instance_type" {
  description = "Type of instance (container or virtual-machine)"
  type        = string
  default     = "container"
}

variable "image" {
  description = "Base image for the instance"
  type        = string
  default     = "images:ubuntu/22.04"
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory size in MB"
  type        = number
}

variable "docker_image" {
  description = "Docker image"
  type        = string
}

variable "port" {
  description = "Port to expose"
  type        = number
}
variable "profiles" {
  description = "The profiles of the network"
  type        = list(string)
  default     = ["default"] 
}

variable "ephemeral" {
  description = "Whether the instance is ephemeral"
  type        = bool
  default     = false  
}

variable "description" {
  description = "Description of the instance"
  type        = string
}

variable "running" {
  description = "Whether the instance is running"
  type        = bool  
}
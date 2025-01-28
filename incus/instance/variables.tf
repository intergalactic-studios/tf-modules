variable "instance_name" {
  description = "Name of the Incus instance"
  type        = string
  default     = "uptime-kuma-instance"
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
  default     = 1024
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 10
}

variable "docker_image" {
  description = "Docker image for Uptime Kuma"
  type        = string
  default     = "louislam/uptime-kuma:latest"
}

variable "port" {
  description = "Port to expose Uptime Kuma"
  type        = number
  default     = 3001
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

variable "cloud_init_user_data" {
  description = "The cloud-init user data"
  type        = string
  default     = file("cloud-init-user-data.yaml")
}
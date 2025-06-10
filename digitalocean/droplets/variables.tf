variable "image" {
  description = "The image ID or slug to use for the Droplet"
  type        = string
}

variable "name" {
  description = "The name of the Droplet"
  type        = string
}

variable "region" {
  description = "The region to start the Droplet in"
  type        = string
}

variable "size" {
  description = "The unique slug that defines the Droplet size"
  type        = string
}

variable "backups" {
  description = "Boolean controlling whether backups are enabled"
  type        = bool
  default     = false
}

variable "monitoring" {
  description = "Boolean controlling whether monitoring is enabled"
  type        = bool
  default     = false
}

variable "ipv6" {
  description = "Boolean controlling whether IPv6 is enabled"
  type        = bool
  default     = false
}

variable "ssh_keys" {
  description = "A list of SSH key IDs or fingerprints to enable in the Droplet"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "A string of the desired User Data for the Droplet"
  type        = string
  default     = ""
}

variable "vpc_uuid" {
  description = "The ID of the VPC to which the Droplet will be assigned"
  type        = string
  default     = null
}

variable "tags" {
  description = "A list of tag names to apply to the Droplet"
  type        = list(string)
  default     = []
}

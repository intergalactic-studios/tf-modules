variable "region" {
    description = "The region where the instance will be created."
    type        = string
}

variable "plan" {
    description = "The plan ID for the instance size."
    type        = string
}

variable "os_id" {
    description = "The operating system ID to use for the instance."
    type        = number
}

variable "label" {
    description = "A label for the instance."
    type        = string
    default     = null
}

variable "ssh_key_ids" {
    description = "A list of SSH key IDs to add to the instance."
    type        = list(string)
    default     = []
}

variable "backups" {
    description = "Enable automatic backups for the instance."
    type        = string
}

variable "hostname" {
    description = "The hostname for the instance."
    type        = string
    default     = null
}

variable "tags" {
    description = "A list of tags to apply to the instance."
    type        = list(string)
    default     = []
}

variable "iso_id" {
    description = "The ISO ID to use for the instance (optional)."
    type        = number
    default     = null
}

variable "app_id" {
    description = "The application ID to use for the instance (optional)."
    type        = number
    default     = null
}

variable "user_data" {
    description = "Cloud-init user data to use for the instance (optional)."
    type        = string
    default     = null
}

variable "enable_ipv6" {
    description = "Enable IPv6 for the instance."
    type        = bool
    default     = false
}

variable "disable_public_ipv4" {
    description = "Disable public IPv4 for the instance."
    type        = bool
    default     = false
}


variable "enable_ddos_protection" {
    description = "Enable DDoS protection for the instance."
    type        = bool
    default     = false
}

variable "activation_email" {
    description = "Send activation email for the instance."
    type        = bool
    default     = false
}

variable "firewall_group_id" {
    description = "The firewall group ID to assign to the instance (optional)."
    type        = string
    default     = null
}

variable "script_id" {
    description = "The script ID to assign to the instance (optional)."
    type        = string
    default     = null
}

variable "reserved_ip_id" {
    description = "The reserved IP ID to assign to the instance (optional)."
    type        = string
    default     = null
}
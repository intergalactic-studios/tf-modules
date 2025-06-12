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
    type        = bool
    default     = false
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
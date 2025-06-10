variable "name" {
  description = "The name of the space"
  type        = string
}

variable "region" {
  description = "The region of the space"
  type        = string
}

variable "acl" {
  description = "The ACL of the space"
  type        = string
  default = "private"
  validation {
      condition     = contains(["private", "public-read"], var.acl)
      error_message = "The type must be one of 'private', 'public-read'."
  }

}

variable "force_destroy" {
  description = "Whether to force destroy the space"
  type        = bool
  default     = false
}
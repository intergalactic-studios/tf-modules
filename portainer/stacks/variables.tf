variable "stack_name" {}
variable "deployment_type" { default = "standalone" } # "standalone", "swarm", "kubernetes"
variable "method" { default = "repository" }           # "string", "file", "repository"

variable "endpoint_id" {
  type = number
}

# For method = string
variable "stack_file_content" {
  type    = string
  default = null
}

# For method = file
variable "stack_file_path" {
  type    = string
  default = null
}

# For method = repository
variable "repository_url" {
  type    = string
  default = null
}

variable "repository_reference_name" {
  type    = string
  default = "refs/heads/main"
}

variable "file_path_in_repository" {
  type    = string
  default = "docker-compose.yml"
}

variable "git_repository_authentication" {
  type    = bool
  default = false
}

variable "repository_username" {
  type    = string
  default = null
}

variable "repository_password" {
  type      = string
  sensitive = true
  default   = null
}

variable "stack_webhook" {
  type    = bool
  default = true
}

variable "update_interval" {
  type    = string
  default = "5m"
}

variable "pull_image" {
  type    = bool
  default = true
}

variable "force_update" {
  type    = bool
  default = true
}

variable "environment_vars" {
  type = list(object({
    name  = string
    value = string
    sensitive = bool
  }))
  default = []
}

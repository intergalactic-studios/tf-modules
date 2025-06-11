variable "name" {
  type = string
}

variable "hostname" {
  type = string
}

variable "description" {
  type    = string
  default = "Generic Incus VM"
}

variable "image" {
  type    = string
  default = "images:ubuntu/24.04/cloud"
}

variable "profiles" {
  type    = list(string)
  default = []
}

variable "cpu" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048
}

variable "cloud_init" {
  type    = string
  default = ""
}

variable "extra_config" {
  type    = map(string)
  default = {}
}

variable "extra_devices" {
  type = list(object({
    name       = string
    type       = string
    properties = map(string)
  }))
  default = []
}

variable "name" {
  description = "The name of the network"
  type        = string
}

variable "device" {
  type        = map(string)
  description = "The device of the network"
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
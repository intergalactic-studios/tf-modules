variable "name" {
  description = "The name of the network ACL"
  type        = string  
}

variable "description" {
  description = "The description of the network ACL"
  type        = string
}

variable "egress" {
  description = "The egress rules for the network ACL"
  type        = list(object({
    action           = string
    destination      = string
    destination_port = string
    protocol         = string
    description      = string
    state            = string
  }))
}

variable "ingress" {
  description = "The ingress rules for the network ACL"
  type        = list(object({
    action           = string
    source           = string
    destination_port = string
    protocol         = string
    description      = string
    state            = string
  }))  
}
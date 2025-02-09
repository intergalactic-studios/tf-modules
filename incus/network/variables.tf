variable "name" {
  description = "The name of the network"
  type        = string
}

variable "description" {
  description = "The description of the network"
  type        = string
  
}

variable "type" {
    description = "The type of the network"
    type        = string
    default = "bridge"
    validation {
        condition     = contains(["bridge", "macvlan", "sriov", "ovn", "physical"], var.type)
        error_message = "The type must be one of 'bridge', 'macvlan', 'sriov', 'ovn', or 'physical'."
    }
}
variable "config" {
  description = "The configuration of the network"
  type        = map(string)
  
}
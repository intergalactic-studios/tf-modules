variable "name" {
  description = "The name of the network"
  type        = string
}

variable "driver" {
  description = "Driver of the network"
  type        = string
    default = "zfs"
    validation {
        condition     = contains(["zfs", "dir", "btrfs", "lvm", "ceph"], var.driver)
        error_message = "The driver must be one of 'zfs', 'dir', 'btrfs', 'lvm', or 'ceph'."
    }
  
}

variable "config" {
  description = "The configuration of the network"
  type        = map(string)
  
}
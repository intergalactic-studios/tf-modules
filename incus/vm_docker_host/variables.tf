variable "name" {
  type = string
}

variable "hostname" {
  type = string
}

variable "description" {
  type    = string
  default = "Incus VM managed by Terraform"
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
  default = 4
}

variable "memory" {
  type    = number
  default = 6144
}

variable "vlan_network" {
  type    = string
  default = "mgmt_vlan"
}

variable "services_vlan_network" {
  type    = string
  default = "services_vlan"
}

variable "zfs_pool" {
  type    = string
  default = "yoruba-pool"
}

variable "ssh_authorized_key" {
  type = string
}

variable "enable_fail2ban" {
  type    = bool
  default = true
}

locals {
  cloud_init = templatefile("${path.module}/templates/cloud-init.yaml.tftpl", {
    hostname           = var.hostname,
    ssh_authorized_key = var.ssh_authorized_key,
    enable_fail2ban    = var.enable_fail2ban,
  })
}

output "cloud_init" { value = local.cloud_init }
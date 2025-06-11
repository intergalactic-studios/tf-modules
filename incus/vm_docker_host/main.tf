terraform {
  required_providers {
    incus = {
      source  = "lxc/incus"
      version = ">= 0.7.0"
    }
  }
}

resource "incus_storage_volume" "docker_data" {
  name        = "${var.name}-data"
  pool        = var.zfs_pool
  description = "Persistent Docker data for ${var.name}"
  type        = "custom"
}

resource "incus_instance" "this" {
  name        = var.name
  description = var.description
  image       = var.image
  type        = "virtual-machine"
  profiles    = var.profiles
  ephemeral   = false
  running     = true

  config = merge({
    "limits.cpu"    = var.cpu
    "limits.memory" = "${var.memory}MB"
  },
    var.cloud_init != "" ? { "cloud-init.user-data" = var.cloud_init } : {},
    var.cloud_init != "" ? { "user.user-data"      = var.cloud_init } : {},
  )

  device {
    name       = "eth0"
    type       = "nic"
    properties = {
      network = var.vlan_network
    }
  }

  device {
    name       = "eth1"
    type       = "nic"
    properties = {
      network = var.services_vlan_network
    }
  }

  device {
    name       = "docker-data"
    type       = "disk"
    properties = {
      pool   = var.zfs_pool
      source = incus_storage_volume.docker_data.name
      path   = "/mnt/docker-data"
    }
  }

  lifecycle {
    ignore_changes = [
      config["cloud-init.user-data"],
      config["user.user-data"],
    ]
  }
}

output "vm_name"      { value = incus_instance.this.name }
output "ip_addresses" { value = incus_instance.this.addresses }

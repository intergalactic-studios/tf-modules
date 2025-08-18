# modules/incus-instance/main.tf
terraform {
  required_providers {
    incus = {
      source  = "lxc/incus"
      version = "~> 0.1"
    }
  }
}

resource "incus_instance" "this" {
  name     = var.name
  image    = var.image
  type     = var.type
  profiles = var.profiles
  running  = true

  config = merge(
    {
      "limits.cpu"    = var.limits.cpu
      "limits.memory" = var.limits.memory
    },
    var.limits.disk != null ? { "limits.disk" = var.limits.disk } : {},
    var.cloud_init_config != null ? {
      "cloud-init.user-data" = base64encode(var.cloud_init_config)
    } : {},
    var.extra_config
  )

  dynamic "device" {
    for_each = var.devices
    content {
      name       = device.value.name
      type       = device.value.type
      properties = device.value.properties
    }
  }
}
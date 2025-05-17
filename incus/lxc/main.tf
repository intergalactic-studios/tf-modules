resource "incus_container" "lxc" {
  name      = var.name
  image     = var.image
  profiles  = var.profiles
  ephemeral = var.ephemeral

  dynamic "device" {
    for_each = var.devices
    content {
      name       = device.value.name
      type       = device.value.type
      properties = device.value.properties
    }
  }

  config = {
    "user.user-data" = file("${path.module}/cloud-init/${var.cloud_init_file}")
  }

  limits = var.limits
}
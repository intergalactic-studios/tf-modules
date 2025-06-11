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
    var.extra_config
  )

  dynamic "device" {
    for_each = var.extra_devices
    content {
      name       = device.value.name
      type       = device.value.type
      properties = device.value.properties
    }
  }

  lifecycle {
    ignore_changes = [
      config["cloud-init.user-data"],
      config["user.user-data"],
    ]
  }
}
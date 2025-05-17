resource "incus_instance" "instance" {
  name        = var.name
  image       = var.image
  description = var.description
  type        = var.type
  profiles    = var.profiles
  ephemeral   = var.ephemeral
  running     = var.running

  config = merge(
    {
      "limits.cpu"    = var.limits.cpu
      "limits.memory" = "${var.limits.memory}MB"
    },
    var.cloud_init != null ? { "cloud-init.user-data" = var.cloud_init } : {},
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
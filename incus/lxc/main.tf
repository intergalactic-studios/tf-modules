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
    var.cloud_init != "" ? { "cloud-init.user-data" = var.cloud_init } : {},
    var.cloud_init != "" ? { "user.user-data" = var.cloud_init } : {}, # Add legacy key
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
output "incus_instance_details" {
  value = {
    name        = incus_instance.instance.name
    description = incus_instance.instance.description
    type        = incus_instance.instance.type
    profiles    = incus_instance.instance.profiles
    ephemeral   = incus_instance.instance.ephemeral
    running     = incus_instance.instance.running
    config      = incus_instance.instance.config
    devices     = { for d in incus_instance.instance.device : d.name => d }
  }
}
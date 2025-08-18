resource "incus_instance" "this" {
  name        = var.name
  image       = var.image
  description = var.description
  type        = var.type
  profiles    = var.profiles
  ephemeral   = var.ephemeral
  running     = var.running

  config = merge(
    {
      "limits.cpu"    = "${var.limits.cpu}"
      "limits.memory" = "${var.limits.memory}"
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
    name        = incus_instance.this.name
    description = incus_instance.this.description
    type        = incus_instance.this.type
    profiles    = incus_instance.this.profiles
    ephemeral   = incus_instance.this.ephemeral
    running     = incus_instance.this.running
    config      = incus_instance.this.config
    devices     = { for d in incus_instance.this.device : d.name => d }
  }
}
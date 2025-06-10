resource "incus_profile" "profile" {
  name = var.name
  description = var.description
  config = var.config
  
  # The devices block is a dynamic block that allows you to create multiple
  dynamic "device" {
    for_each = var.devices
    content {
      name       = device.value.name
      type       = device.value.type
      properties = device.value.properties
    }
  }
}
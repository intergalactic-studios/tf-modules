resource "incus_network" "network" {
  name = var.name
  type = var.type
  description = var.description
  config = var.config


  depends_on = [null_resource.disable_eno1]

  lifecycle {
    ignore_changes = [
      config["bridge.external_interfaces"], # Ignore changes to avoid conflicts when disabling eno1
    ]
  }
}
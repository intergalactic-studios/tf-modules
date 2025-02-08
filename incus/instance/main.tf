resource "incus_instance" "instance" {
  name        = var.instance_name

  image       = var.image
  description = var.description
  type        = var.instance_type
  profiles    = var.profiles
  ephemeral   = var.ephemeral
  running     = var.running

  file {
    name = "Dockerfile"
    content = <<-EOF
      FROM ${var.docker_image}
      EXPOSE ${var.port}
    EOF
  }

  config = {
    "limits.cpu"    = var.cpu_cores
    "limits.memory" = "${var.memory}MB"
    "cloud-init.user-data" = file("${path.module}/cloud-init-user-data.yml")
  }

  device {
    for_each = { for device in jsondecode(file("${path.module}/devices.json")) : device.name => device }
      name       = each.value.name
      type       = each.value.type
      properties = each.value.properties
  }
}


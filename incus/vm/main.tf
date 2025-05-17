resource "incus_instance" "instance" {
  name        = var.instance_name

  image       = var.image
  description = var.description
  type        = var.instance_type
  profiles    = var.profiles
  ephemeral   = var.ephemeral
  running     = var.running

  file {
    target_path = "/root/Dockerfile"
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

  dynamic "device" {
    for_each = jsondecode(file("${path.module}/devices.json"))

    content {
      name       = device.value.name
      type       = device.value.type
      properties = device.value.properties
    }
  }
}


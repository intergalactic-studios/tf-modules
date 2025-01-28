resource "incus_instance" "uptime_kuma" {
  name        = var.instance_name
  type        = var.instance_type
  image       = var.image
  profiles    = var.profiles
  ephemeral   = var.ephemeral

  config = {
    "limits.cpu"    = var.cpu_cores
    "limits.memory" = "${var.memory}MB"
    "cloud-init.user-data" = file("${path.module}/cloud-init-user-data.yml")
  }

  device {
    name = "root"
    type = "disk"
    properties = {
      pool = "default" 
      size = "${var.disk_size}GB"
      path = "/"
    }
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      network = "incusbr1"
    }
  }
}
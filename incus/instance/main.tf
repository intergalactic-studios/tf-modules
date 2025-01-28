resource "incus_instance" "instance" {
  name        = var.instance_name
  type        = var.instance_type
  image       = var.image
  profiles    = var.profiles
  ephemeral   = var.ephemeral

  config = {
    "limits.cpu"    = var.cpu_cores
    "limits.memory" = "${var.memory}MB"
    "cloud-init.user-data" = file("${var.cloud_init_user_data}")
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
      network = "incusbr0"
    }
  }
}
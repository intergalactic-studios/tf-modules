resource "incus_network" "network" {
  name = var.name
  type = var.type
  description = var.description
  #config = var.config
  config = {
    ipv4.address = "192.168.2.1/24"
    ipv4.nat = "false"
  }
}

# Step 2: Set up routing using null_resource to add routes
resource "null_resource" "routing" {
  provisioner "remote-exec" {
    inline = [
      "sudo ip route add 192.168.2.0/24 dev incusbr1",
      "sudo ip route add 192.168.1.0/24 dev eno1"  # Adjust eno1 if using a different interface
    ]
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [incus_network.network]
}

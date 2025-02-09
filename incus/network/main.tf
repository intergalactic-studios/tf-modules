resource "incus_network" "network" {
  name = var.name
  type = var.type
  description = var.description
  config = var.config

}

# Step 2: Set up routing using null_resource to add routes
resource "null_resource" "routing" {
  provisioner "remote-exec" {
    inline = [
      "sudo ip route add 192.168.2.0/24 dev incusbr1",
      "sudo ip route add 192.168.1.0/24 dev eno1"  # Adjust eno1 if using a different interface
    ]

    when = "create"  # Run the inline commands during creation
  }

  provisioner "remote-exec" {
    inline = [
      "sudo ip route del 192.168.2.0/24",
      "sudo ip route del 192.168.1.0/24"
    ]

    when = "destroy"  # Run the commands during destruction
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [incus_network.network]
}

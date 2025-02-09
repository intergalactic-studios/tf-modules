resource "incus_network" "network" {
  name = var.name
  type = var.type
  description = var.description
  config = var.config

}

# Step 2: Set up routing using null_resource to add routes
resource "null_resource" "routing" {

  connection {
    type        = "ssh"
    host        = "192.168.1.90"        # IP of your mini PC running Incus
    user        = "intergalactic"        # The SSH user for your mini PC
    private_key = file("~/.ssh/homelab_ed25519")  # Path to your private key for SSH authentication
  }

  provisioner "remote-exec" {
    inline = [
      "sudo ip route show 192.168.2.0/24 || sudo ip route add 192.168.2.0/24 dev incusbr1",
      "sudo ip route show 192.168.1.0/24 || sudo ip route add 192.168.1.0/24 dev eno1"  # Adjust eno1 if needed
    ]

    when = create  # Run the inline commands during creation
  }

  provisioner "remote-exec" {
    inline = [
      "sudo ip route del 192.168.2.0/24",
      "sudo ip route del 192.168.1.0/24"
    ]

    when = destroy  # Run the commands during destruction
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [incus_network.network]
}

# Add route to this network on the local computer

# resource "null_resource" "routing" {
#   provisioner "local-exec" {
#     command = "sudo route -n add 192.168.2.0/24 192.168.1.90"
#   }

#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   depends_on = [incus_network.network]
# }

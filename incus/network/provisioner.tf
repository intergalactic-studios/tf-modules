resource "null_resource" "disable_eno1" {

  connection {
    type        = "ssh"
    host        = "192.168.1.92"        # IP of your mini PC running Incus
    user        = "intergalactic"        # The SSH user for your mini PC
    private_key = file("~/.ssh/homelab_ed25519")  # Path to your private key for SSH authentication
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Disabling eno1 and setting up bridge incusbr1'",
      "sudo ip addr flush dev eno1",
    ]
  }
}

# Step 2: Set up routing using null_resource to add routes
resource "null_resource" "routing" {

  connection {
    type        = "ssh"
    host        = "192.168.1.92"        # IP of your mini PC running Incus
    user        = "intergalactic"        # The SSH user for your mini PC
    private_key = file("~/.ssh/homelab_ed25519")  # Path to your private key for SSH authentication
  }
  
  provisioner "remote-exec" {
    inline = [
      # Add network routes (ensure routing works for the .2.x subnet)
      "sudo ip route add 192.168.2.0/24 dev incusbr1",
      "sudo ip route add 192.168.1.0/24 dev eno1",
      "sudo systemctl restart networking"
    ]
  }

  # Destroy script: Removes NAT and IP forwarding rules
  provisioner "remote-exec" {
    when = destroy
    inline = [
      # Remove network routes (ensure routing works for the .2.x subnet)
      "sudo ip route del 192.168.2.0/24 dev incusbr1",
      "sudo ip route del 192.168.1.0/24 dev eno1"
    ]
  }

  depends_on = [incus_network.network]
}
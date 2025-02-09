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
      # Enable IP forwarding
      "echo 'net.ipv4.ip_forward=1' | sudo tee /etc/sysctl.d/99-incus.conf",
      "sudo sysctl --system",

      # Setup NAT with nftables
      "sudo nft add table inet incus_nat || true",
      "sudo nft add chain inet incus_nat postrouting { type nat hook postrouting priority 100 \\; } || true",
      "sudo nft add rule inet incus_nat postrouting ip saddr 192.168.2.0/24 oifname eno1 masquerade || true",

      # Persist nftables rules
      "echo 'table inet incus_nat { chain postrouting { type nat hook postrouting priority 100; policy accept; ip saddr 192.168.2.0/24 oifname eno1 masquerade } }' | sudo tee /etc/nftables.conf",
      "sudo systemctl restart nftables"
    ]
  }

  # Destroy script: Removes NAT and IP forwarding rules
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo nft delete table inet incus_nat || true",
      "sudo rm -f /etc/sysctl.d/99-incus.conf",
      "sudo sysctl --system"
    ]
  }
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

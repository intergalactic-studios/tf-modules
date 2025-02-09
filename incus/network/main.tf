resource "incus_network" "network" {
  name = var.name
  type = var.type
  description = var.description
  #config = var.config
}

resource "null_resource" "nftables_setup" {
  depends_on = [incus_network.network]

  connection {
    type        = "ssh"
    host        = "192.168.1.90"        # Replace with your mini PC's IP
    user        = "intergalactic"       # Replace with the SSH user you use for authentication
    private_key = file("~/.ssh/homelab_ed25519")  # Path to your private key
  }

  provisioner "remote-exec" {
    inline = [
      "sudo ip route add 192.168.2.0/24 dev incusbr1 proto static",
      "sudo nft add table inet incus_nat",
      "sudo nft add chain inet incus_nat postrouting { type nat hook postrouting priority 100 \; }",
      "sudo nft add rule inet incus_nat postrouting ip saddr 192.168.2.0/24 oifname 'eno1' masquerade",
      "sudo nft add table inet incus_filter",
      "sudo nft add chain inet incus_filter forward { type filter hook forward priority 0 \; policy drop \; }",
      "sudo nft add rule inet incus_filter forward ct state related,established accept",
      "sudo nft add rule inet incus_filter forward iifname 'eno1' oifname 'incusbr1' accept",
      "sudo nft add rule inet incus_filter forward iifname 'incusbr1' oifname 'eno1' ip daddr 192.168.1.90 accept",
      "sudo nft add rule inet incus_filter forward iifname 'incusbr1' oifname 'eno1' drop",
      "sudo nft list ruleset > /etc/nftables.rules",
      "sudo systemctl enable nftables-restore"
    ]
  }

  provisioner "remote-exec" {
    when    = destroy
    inline = [
      "sudo nft delete table inet incus_nat",
      "sudo nft delete table inet incus_filter",
      "sudo rm -f /etc/nftables.rules"
    ]
  }
}

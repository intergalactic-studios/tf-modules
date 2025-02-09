resource "incus_network_acl" "incusbr1_acl" {
  name        = "incusbr1"
  description = "Network ACL to control access to containers"

  ingress = [
    {
      action  = "allow"
      source  = "192.168.1.0/24"
      state   = "enabled"
    },
    {
      action  = "reject"
      source  = "0.0.0.0/0"  # Drop everything else by default
      state   = "enabled"
    }
  ]

  egress = [
    {
      action     = "allow"
      destination = "0.0.0.0/0"  # Allow all outbound traffic to the internet
      state      = "enabled"
    },
    {
      action     = "allow"
      destination = "192.168.1.0/24"  # Allow outbound traffic to 192.168.1.x (laptop access)
      state      = "enabled"
    }
  ]
  depends_on = [incus_network.network]
}

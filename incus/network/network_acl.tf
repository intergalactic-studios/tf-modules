resource "incus_network_acl" "incusbr1_acl" {
  name = "incusbr1_acl"
  description = "Network ACL to control access to containers"

  ingress = [
    {
      action = "accept"
      source = "192.168.1.0/24"
      state  = "NEW"
    },
    {
      action = "drop"
      source = "0.0.0.0/0"  # Drop everything else by default
      state  = "NEW"
    }
  ]

  egress = [
    {
      action = "accept"
      destination = "192.168.1.0/24"
      state  = "NEW"
    },
    {
      action = "drop"
      destination = "0.0.0.0/0"  # Drop everything else by default
      state  = "NEW"
    }
  ]
}
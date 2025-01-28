resource "incus_network_acl" "acl1" {
  name = var.name
  description = var.description
  
  egress = var.egress
  ingress = var.ingress
}
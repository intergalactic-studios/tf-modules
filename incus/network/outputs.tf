output "incus_network_details" {
  value = {
    name          = incus_network.incusbr1.name
    ipv4_address  = incus_network.incusbr1.config["ipv4.address"]
    nat           = incus_network.incusbr1.config["ipv4.nat"]
    routing       = incus_network.incusbr1.config["ipv4.routing"]
  }
}
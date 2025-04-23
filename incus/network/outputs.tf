output "incus_network_details" {
  value = {
    name          = incus_network.incusbr0.name
    #ipv4_address  = incus_network.incusbr0.config["ipv4.address"]
    type          = incus_network.incusbr0.type
    description   = incus_network.incusbr0.description
    # ipv4_nat  = incus_network.incusbr0.config["ipv4.nat"]
    # ipv4_dhcp  = incus_network.incusbr0.config["ipv4.dhcp"]
    # #ipv4_gateway  = incus_network.incusbr0.config["ipv4.dhcp.gateway"]
    # routes           = incus_network.incusbr0.config["ipv4.routes"]
    # routing           = incus_network.incusbr0.config["ipv4.routing"]
  }
}
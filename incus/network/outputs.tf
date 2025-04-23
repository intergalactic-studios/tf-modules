output "incus_network_details" {
  value = {
    name          = incus_network.bridge0.name
    ipv4_address  = incus_network.bridge0.config["ipv4.address"]
    type          = incus_network.bridge0.type
    description   = incus_network.bridge0.description
    # ipv4_nat  = incus_network.bridge0.config["ipv4.nat"]
    # ipv4_dhcp  = incus_network.bridge0.config["ipv4.dhcp"]
    # #ipv4_gateway  = incus_network.bridge0.config["ipv4.dhcp.gateway"]
    # routes           = incus_network.bridge0.config["ipv4.routes"]
    # routing           = incus_network.bridge0.config["ipv4.routing"]
  }
}
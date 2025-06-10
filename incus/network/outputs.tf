output "incus_network_details" {
  value = {
    name          = incus_network.network.name
    #ipv4_address  = incus_network.network.config["ipv4.address"]
    type          = incus_network.network.type
    description   = incus_network.network.description
    # ipv4_nat  = incus_network.network.config["ipv4.nat"]
    # ipv4_dhcp  = incus_network.network.config["ipv4.dhcp"]
    # #ipv4_gateway  = incus_network.network.config["ipv4.dhcp.gateway"]
    # routes           = incus_network.network.config["ipv4.routes"]
    # routing           = incus_network.network.config["ipv4.routing"]
  }
}
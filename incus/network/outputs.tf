output "incus_network_details" {
  value = {
    name          = incus_network.network.name
    ipv4_address  = incus_network.network.config["ipv4.address"]
    ipv4_nat  = incus_network.network.config["ipv4.nat"]
    ipv4_dhcp  = incus_network.network.config["ipv4.dhcp"]
    ipv4_dhcp_ranges  = incus_network.network.config["ipv4.dhcp_ranges"]
    ipv4_gateway  = incus_network.network.config["ipv4.dhcp.gateway"]
    routes           = incus_network.network.config["ipv4.routes"]
    routing           = incus_network.network.config["ipv4.routing"]
  }
}
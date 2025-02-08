output "incus_network_details" {
  value = {
    name          = incus_network.network.name
    ipv4_address  = incus_network.network.config["ipv4.domain"]
    ipv4_address  = incus_network.network.config["ipv4.search"]
    ipv4_address  = incus_network.network.config["ipv4.address"]
    ipv4_address  = incus_network.network.config["ipv4.nat"]
    ipv4_address  = incus_network.network.config["ipv4.dhcp"]
    ipv4_address  = incus_network.network.config["ipv4.dhcp.ranges"]
    ipv4_address  = incus_network.network.config["ipv4.dhcp.gateway"]
    nat           = incus_network.network.config["ipv4.routes"]
    nat           = incus_network.network.config["ipv4.routing"]
    routing       = incus_network.network.config["ipv4.domain"]
  }
}
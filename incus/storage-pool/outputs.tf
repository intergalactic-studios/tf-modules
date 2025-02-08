output "incus_storage_pool_details" {
  value = {
    name          = incus_storage_pool.pool.name
    # ipv4_address  = incus_storage_pool.pool.config["ipv4.address"]
    # nat           = incus_storage_pool.pool.config["ipv4.nat"]
    # routing       = incus_storage_pool.pool.config["ipv4.routing"]
  }
}
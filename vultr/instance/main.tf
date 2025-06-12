resource "vultr_instance" "this" {
  hostname             = var.instance_hostname
  region               = var.region
  plan                 = var.instance_plan
  os_id                = var.os_id
  iso_id               = var.iso_id
  app_id               = var.app_id
  label                = var.instance_label
  tags                 = var.instance_tags

  user_data            = var.user_data
  ssh_key_ids          = var.ssh_key_ids

  enable_ipv6          = var.enable_ipv6
  disable_public_ipv4  = var.disable_public_ipv4
  backups              = var.enable_backups
  ddos_protection      = var.enable_ddos_protection
  activation_email     = var.activation_email

  # Optional improvements
  firewall_group_id    = var.firewall_group_id
  script_id            = var.script_id
  reserved_ip_id       = var.reserved_ip_id
}

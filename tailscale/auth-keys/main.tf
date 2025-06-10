resource "tailscale_tailnet_key" "key" {
  reusable      = var.reusable
  ephemeral     = var.ephemeral
  preauthorized = var.preauthorized
  expiry        = var.expiry
  description   = var.description
}
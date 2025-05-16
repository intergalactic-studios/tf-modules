output "auth_keys" {
  value = {
    key       = tailscale_tailnet_key.key
    reusable  = tailscale_tailnet_key.reusable
  }
}

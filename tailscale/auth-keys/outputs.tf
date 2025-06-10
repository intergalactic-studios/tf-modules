output "auth_keys" {
    value = tailscale_tailnet_key.key
    sensitive = true
}

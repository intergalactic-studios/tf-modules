resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_generic_endpoint" "user_accounts" {
  for_each = { for u in var.vault_users : u.username => u }

  path = "auth/userpass/users/${each.value.username}"
  data_json = jsonencode({
    password = each.value.password
    policies = each.value.policies
  })
}

# resource "vault_auth_backend" "oidc" {
#   count = var.enable_oidc ? 1 : 0

#   type        = "oidc"
#   description = "OIDC auth backend"
#   path        = "oidc"
# }

# resource "vault_identity_oidc_provider" "default" {
#   count = var.enable_oidc ? 1 : 0

#   name              = "default"
#   issuer_url        = var.oidc_discovery_url
#   client_id         = var.oidc_client_id
#   client_secret     = var.oidc_client_secret
#   allowed_redirect_uris = var.oidc_redirect_uris
# }

# resource "vault_identity_oidc_key" "default" {
#   count = var.enable_oidc ? 1 : 0

#   name       = "default-key"
#   algorithm  = "RS256"
#   rotation_period = "24h"
# }
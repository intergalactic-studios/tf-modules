variable "vault_users" {
  description = "List of Vault users with their passwords and policies"
  type = list(object({
    username = string
    password = string
    policies = list(string)
  }))
}

variable "kv_path" {
  description = "Path for KV secrets engine"
  type        = string
  default     = "secret"
}

variable "ssh_path" {
  description = "Path for SSH secrets engine (optional)"
  type        = string
  default     = "ssh"
}

variable "enable_ssh" {
  description = "Whether to enable SSH secrets engine"
  type        = bool
  default     = false
}

variable "policy_name" {
  description = "Name of the policy to create"
  type        = string
}
variable "policy_content" {
  description = "Content of the policy to create"
  type        = string  
}
# variable "enable_oidc" {
#   description = "Whether to enable OIDC authentication"
#   type        = bool
#   default     = false
# }

# variable "oidc_client_id" {
#   description = "OIDC Client ID"
#   type        = string
#   default     = ""
# }

# variable "oidc_client_secret" {
#   description = "OIDC Client Secret"
#   type        = string
#   default     = ""
#   sensitive   = true
# }

# variable "oidc_discovery_url" {
#   description = "OIDC Discovery URL"
#   type        = string
#   default     = ""
# }

# variable "oidc_redirect_uris" {
#   description = "List of allowed redirect URIs for OIDC login"
#   type        = list(string)
#   default     = []
# }

# variable "oidc_default_role" {
#   description = "Default OIDC role name"
#   type        = string
#   default     = "default"
# }
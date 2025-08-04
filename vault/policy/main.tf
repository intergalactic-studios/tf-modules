resource "vault_policy" "this" {
  name = var.policy_name

  policy = var.policy_content
}

variable "policy_name" {
  description = "Name of the policy to create"
  type        = string
}
variable "policy_content" {
  description = "Content of the policy to create"
  type        = string  
}

output "name" {
  value = vault_policy.this.name  
}
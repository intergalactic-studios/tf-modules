output "webhook_url" {
  value       = portainer_stack.this.webhook_url
  description = "GitOps webhook URL"
}

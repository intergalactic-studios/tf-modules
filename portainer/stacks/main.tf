resource "portainer_stack" "this" {
  name            = var.stack_name
  deployment_type = var.deployment_type
  method          = var.method
  endpoint_id     = var.endpoint_id

  # For method = "string"
  stack_file_content = var.method == "string" ? var.stack_file_content : null

  # For method = "file"
  stack_file_path = var.method == "file" ? var.stack_file_path : null

  # For method = "repository"
  repository_url              = var.method == "repository" ? var.repository_url : null
  repository_reference_name   = var.method == "repository" ? var.repository_reference_name : null
  file_path_in_repository     = var.method == "repository" ? var.file_path_in_repository : null
  git_repository_authentication = var.method == "repository" ? var.git_repository_authentication : null
  repository_username         = var.method == "repository" ? var.repository_username : null
  repository_password         = var.method == "repository" ? var.repository_password : null

  # GitOps options
  stack_webhook   = var.stack_webhook
  update_interval = var.update_interval
  pull_image      = var.pull_image
  force_update    = var.force_update

  # Common env vars
  dynamic "env" {
    for_each = var.environment_vars
    content {
      name  = env.value.name
      value = env.value.value
    }
  }

}

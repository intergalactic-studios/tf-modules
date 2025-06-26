resource "portainer_docker_secret" "example_secret" {
  endpoint_id = var.endpoint_id
  name        = var.secret_name
  data        = var.secret_data

#   labels = {
#     "com.example.some-label" = "some-value"
#   }
  # Common env vars
  dynamic "labels" {
    for_each = var.labels
    content {
      name  = env.value.name
      value = env.value.value
    }
  }

}

variable "endpoint_id" {
  description = "The ID of the Portainer endpoint where the secret will be created."
  type        = string
}
variable "secret_name" {
  description = "The name of the secret to be created."
  type        = string
}
variable "secret_data" {
  description = "The data for the secret, base64 encoded."
  type        = string
}
variable "labels" {
  description = "A map of labels to apply to the secret."
  type        = map(string)
  default     = {}
}
resource "portainer_docker_secret" "example_secret" {
  endpoint_id = var.endpoint_id
  name        = var.secret_name
  data        = var.secret_data
    

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
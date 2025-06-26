resource "digitalocean_spaces_key" "this" {
  name   = var.name
  grant {
    bucket     = var.bucket_name
    permission = var.permission
  }
}
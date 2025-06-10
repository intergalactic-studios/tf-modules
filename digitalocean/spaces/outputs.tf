output "name" {
  value = digitalocean_spaces_bucket.space.name  
}
output "region" {
  value = digitalocean_spaces_bucket.space.region
}
output "acl" {
  value = digitalocean_spaces_bucket.space.acl
}

output "endpoint" {
  value = digitalocean_spaces_bucket.space.endpoint
}
output "bucket_domain_name" {
  value = digitalocean_spaces_bucket.space.bucket_domain_name
}
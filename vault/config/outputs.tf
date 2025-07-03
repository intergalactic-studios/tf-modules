output "kv_mount_path" {
  value = vault_mount.kv.path
}

output "usernames" {
  value = [for u in var.vault_users : u.username]
}
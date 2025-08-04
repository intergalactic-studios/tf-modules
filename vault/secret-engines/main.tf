resource "vault_mount" "kv" {
  path = var.kv_path
  type = "kv-v2"
  description = "Key-Value Secrets Engine"
}

resource "vault_mount" "ssh" {
  count = var.enable_ssh ? 1 : 0

  path = var.ssh_path
  type = "ssh"
  description = "SSH Secrets Engine"
}
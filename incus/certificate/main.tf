resource "incus_certificate" "client" {
  name        = var.client_name
  description = var.description
  restricted  = var.restricted
  #projects    = [incus_project.project1.name]
  type        = var.type
  certificate = file("${path.module}/metrics.crt")
}
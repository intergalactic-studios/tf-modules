terraform {
  required_version = ">= 1.3.0"
  required_providers {
    incus = {
      source  = "lxc/incus"
      version = ">= 0.3.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}
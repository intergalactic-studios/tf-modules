# tf-modules

A collection of reusable [Terraform](https://www.terraform.io/) modules for managing cloud and infrastructure resources across multiple providers, including DigitalOcean, Incus, Tailscale, Vultr, and Cloudflare.

## Structure

This repository is organized by provider and resource type:

```
cloudflare/
digitalocean/
  droplets/
  spaces/
incus/
  certificate/
  lxc/
  network/
  profile/
  project/
  storage-pool/
  storage-volume/
  vm/
tailscale/
  auth-keys/
vultr/
```

Each module contains its own `main.tf`, `variables.tf`, and `outputs.tf` files.

## Modules Overview

### DigitalOcean

- **Droplets**: Provision and manage DigitalOcean Droplets.
- **Spaces**: Manage DigitalOcean Spaces (object storage).

### Incus

- **certificate**: Manage Incus client certificates.
- **lxc**: Deploy and configure LXC containers or VMs.
- **network**: Create and configure Incus networks.
- **profile**: Manage Incus profiles with custom devices and config.
- **storage-pool**: Manage Incus storage pools.
- **storage-volume**: Manage Incus storage volumes.
- **vm**: Deploy and configure Incus virtual machines.

### Tailscale

- **auth-keys**: Manage Tailscale authentication keys for automation.

### Vultr & Cloudflare

- Placeholder directories for future modules.

## Usage

Each module is self-contained. To use a module, reference it in your Terraform configuration:

```hcl
module "example_vm" {
  source        = "../incus/vm"
  instance_name = "my-vm"
  memory        = 2048
  cpu_cores     = 2
  docker_image  = "nginx:latest"
  port          = 80
  description   = "Example VM"
  running       = true
  profiles      = ["default"]
}
```

Adjust variables as needed for each module. See the `variables.tf` in each module directory for available options.

## Requirements

- [Terraform](https://www.terraform.io/) >= 1.0
- Provider plugins for DigitalOcean, Incus, Tailscale, etc.

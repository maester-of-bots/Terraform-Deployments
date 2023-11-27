terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.1"
    }
  }
}

resource "proxmox_lxc" "lxc_container" {
  target_node = var.target_node
  cores = var.cores
  memory = var.memory
  hostname = var.hostname
  password = var.password
  network  {
    name = var.network_name
    bridge = var.network_bridge
    ip = var.network_ip
  }
  start = var.start
  ostemplate = var.ostemplate
  rootfs {
    storage = var.rootfs_storage
    size = var.rootfs_size
  }
}

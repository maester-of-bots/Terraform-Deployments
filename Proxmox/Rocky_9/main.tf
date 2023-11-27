terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.1"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://172.16.8.6:8006/api2/json"
  pm_user = "root@pam"
  pm_password = ""
  pm_tls_insecure = true
}

module "lxc_test" {
  source = "./proxmox_lxc_module"
  target_node    = "HV01"
  cores          = 2
  memory         = 6000
  hostname       = "TGS-TEMPLATE-Rocky9"
  password       = ""
  network_name   = "eth0"
  network_bridge = "vmbr0"
  network_ip     = "dhcp"
  start          = true
  ostemplate     = "local:vztmpl/rockylinux-9-default_20221109_amd64.tar.xz"
  rootfs_storage = "local-lvm"
  rootfs_size    = "100G"
}
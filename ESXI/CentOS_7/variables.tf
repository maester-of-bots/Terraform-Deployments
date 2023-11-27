variable "vsphere_user" {
  description = "vCenter Administrator username."
}

variable "vsphere_password" {
  description = "vCenter administrator password."
}

variable "vsphere_server" {
  description = "IP Address of the vCenter server."
  type        = string
}

variable "datastore" {
  description = "Datastore where the VM will be stored."
  type        = string
}

variable "template_name" {
  description = "Name of the template we're deploying."
  type        = string
}

variable "network_name" {
  description = "Name of the network being used."
  type        = string
}

variable "VM_Name" {
  description = "What should we name the VM?"
  type        = string
}

variable "VM_Hostname" {
  description = "Same as the above but it's the system hostname, not the name in ESXI"
  type        = string
}

variable "VM_Domain" {
  description = "What domain should this be a member of?"
  type        = string
}

variable "vm_IP" {
  description = "The IP address we want the VM to have."
  type        = string
}

variable "vm_mask" {
  description = "The VM's subnet mask."
  type        = number
}

variable "resource_pool" {
  description = "Dummy value for resource pool, since we don't have resource pools."
  type        = string
}

variable "vm_gateway" {
  description = "The VM's default gateway."
  type        = string
}

variable "count_cpu" {
  description = "How many CPU cores?"
  type        = number
}

variable "count_ram" {
  description = "How many MB of RAM?"
  type        = number
}

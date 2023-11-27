
variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
}
variable "client_id" {
  description = "Azure Client ID."
  type        = string
}
variable "client_secret" {
  description = "Azure Client Secret."
  type        = string
}
variable "tenant_id" {
  description = "Azure Tenant ID."
  type        = string
}
variable "resource_group" {
  description = "Azure resource group to deploy to."
  type        = string
}
variable "zone" {
  description = "Azure location zone."
  type        = string
}



variable "network_name" {
  description = "The name of the new virtual network."
  type        = string
}
variable "address_space" {
  description = "The network's address space (With slash subnet)."
  type        = string
}
variable "subnet_name" {
  description = "The name of the new subnet."
  type        = string
}
variable "subnet_space" {
  description = "The subnet's address space (With slash subnet)."
  type        = string
}
variable "public_ip_name" {
  description = "The new public IP address name."
  type        = string
}
variable "public_ip_type" {
  description = "Static or Dynamic public IP?."
  type        = string
}


variable "nsg_name" {
  description = "Azure Network Security Group name."
  type        = string
}
variable "remote_access_type" {
  description = "Defining the remote access method."
  type        = string
}
variable "remote_access_port" {
  description = "Defining remote access port."
  type        = string
}

variable "allowed_IP" {
  description = "Defining IP addresses allowed to SSH."
  type        = string
}
variable "nic_name" {
  description = "Naming the new NIC."
  type        = string
}
variable "VM_Name" {
  description = "The name of the VM being deployed."
  type        = string
}



variable "VM_Size" {
  description = "Size code for Azure VM."
  type        = string
}
variable "admin_user" {
  description = "Admin username to be created."
  type        = string
}
variable "admin_password" {
  description = "Password for the new admin account."
  type        = string
}
variable "disk_size" {
  description = "Virtual disk size."
  type        = string
}
variable "os_publisher" {
  description = "The name of the OS."
  type        = string
}
variable "os_offer" {
  description = "The OS + release number."
  type        = string
}
variable "os_sku" {
  description = "The release number."
  type        = string
}
variable "os_version" {
  description = "The OS version."
  type        = string
}
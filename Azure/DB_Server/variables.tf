
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

variable "allowed_IP" {
  description = "Defining IP addresses allowed to connect to the database."
  type        = string
}

variable "VM_Name" {
  description = "The name of the VM being deployed."
  type        = string
}

variable "admin_user" {
  description = "Admin username to be created."
  type        = string
}
variable "name" {
  description = "Name for resources"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
}

variable "rgName" {
  description = "Resource Group name"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}   
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "enable_public_ip" {
  description = "Enable public IP for the VM"
  type        = bool
  default     = false
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string  
  default     = "dummy-admin-name"
}
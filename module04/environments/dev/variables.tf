variable "name" {
  description = "Base name for resources"
  type        = string
  default     = "default"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
}

variable "subsciption_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}  
  
}

variable "env" {
  description = "Environment suffix for resource names"
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "enable_public_ip" {
  description = "Enable public IP for the VM"
  type        = bool
  default     = false
}

variable "vnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
}

variable "snet_cidr" {
  description = "The CIDR block for the Subnet"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string  
}
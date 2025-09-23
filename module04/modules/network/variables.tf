variable "name" {
  description = "Name for resources"
  type        = string
  
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default = "westeurope"
}
variable "rgName" {
  description = "Resource Group name"
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

variable "vnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  type        = string
}

variable "snet_cidr" {
  description = "The CIDR block for the Subnet"
  type        = string
}
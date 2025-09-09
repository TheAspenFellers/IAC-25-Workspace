variable "base_name" {
  description = "Base name for resources"
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
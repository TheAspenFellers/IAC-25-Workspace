variable "base_name" {
  description = "Base name for resources"
  type        = string
  default = "default"
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
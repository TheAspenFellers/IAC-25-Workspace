variable "name" {
  description = "Base name for resources"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
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
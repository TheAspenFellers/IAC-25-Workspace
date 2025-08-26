variable "location" {
  type        = string
  description = "deployment location"
  default     = "West Europe"
}

variable "rgName" {
  type        = string
  description = "Resource group name"
  default     = "rg-default"
}

variable "saName" {
  type        = string
  description = "Storage account name"
  default     = "sa-default"
}
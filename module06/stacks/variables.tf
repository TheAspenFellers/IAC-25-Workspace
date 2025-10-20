variable "location" {
  description = "Azure region for all resources."
  type        = string
}

variable "unique_suffix" {
  description = "Unique, short suffix to ensure global-unique names (letters/digits). Leave empty to auto-generate."
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Short prefix for naming (e.g. course or class code). Lowercase letters and digits only."
  type        = string
}

variable "resource_group_name" {
  description = "Optional explicit RG name. If empty, a name is composed from prefix and suffix."
  type        = string
  default     = ""
}

variable "storage_account_name" {
  description = "Optional explicit Storage Account name (must be globally unique, 3-24 lowercase alphanum). If empty, composed automatically."
  type        = string
  default     = ""
}

variable "saTier" {
  description = "Storage Account tier."
  type        = string
  default     = "Standard"

}

variable "saReplication" {
  description = "Storage Account replication type."
  type        = string
  default     = "LRS"
}

variable "env" {
  description = "Environment tag."
  type        = string
  default     = ""
}

variable "project" {
  description = "Project tag."
  type        = string
  default     = ""
}

locals {
  # normalize suffix
  suffix = length(var.unique_suffix) > 0 ? lower(var.unique_suffix) : ""

  # composed names if not provided
  rg_name = var.resource_group_name != "" ? var.resource_group_name : (
    local.suffix != "" ? "rg-${local.suffix}" : "rg-${var.name_prefix}"
  )

  # SA must be 3–24, lowercase alphanum. Keep it short.
  sa_name = var.storage_account_name != "" ? var.storage_account_name : (
    local.suffix != "" ? "st${var.name_prefix}${local.suffix}" : "st${var.name_prefix}"
  )

  tags = {
    Environment = var.env
    Project     = var.project
  }
}

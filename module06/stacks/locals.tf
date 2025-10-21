locals {
  # normalize suffix
  suffix = length(var.unique_suffix) > 0 ? lower(var.unique_suffix) : ""

  # composed names if not provided
  rg_name = "${var.name_prefix}-${var.resource_group_name}-${local.suffix}"

  # SA must be 3–24, lowercase alphanum. Keep it short.
  sa_name = "${var.name_prefix}${var.storage_account_name}${local.suffix}"

  tags = {
    Environment = var.env
    Project     = var.project
  }
}

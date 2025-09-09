resource "azurerm_resource_group" "rg-default" {
  name     = "rg-${var.base_name}-${local.suffix}"
  location = var.location
  tags     = local.tags
}
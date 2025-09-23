resource "azurerm_resource_group" "rg-default" {
  name     = "rg_${var.name}-${local.suffix}"
  location = var.location
  tags = var.tags
}
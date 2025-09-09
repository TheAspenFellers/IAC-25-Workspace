resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.base_name}-${local.suffix}"
  location            = var.location
  resource_group_name = var.rgName
}
resource "azurerm_virtual_network" "vn-default" {
  name                = "vn-${var.base_name}-${local.suffix}"
  location            = var.location
  resource_group_name = var.rgName
  address_space       = ["10.0.0.0/16"]

  tags = local.tags
}

resource "azurerm_subnet" "sn-default" {
  name                 = "sn-${var.base_name}-${local.suffix}"
  resource_group_name  = var.rgName
  virtual_network_name = azurerm_virtual_network.vn-default.name
  address_prefixes     = ["10.0.1.0/24"]  
}

resource "azurerm_subnet_network_security_group_association" "sn-nsg-assoc" {
  subnet_id                 = azurerm_subnet.sn-default.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
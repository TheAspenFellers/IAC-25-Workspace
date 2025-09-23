resource "azurerm_network_security_group" "nsg" {
  name                = "nsg_${var.name}_${local.suffix}"
  location            = var.location
  resource_group_name = var.rgName
  tags = var.tags

    security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.snet_cidr
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "DenyAllInbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_virtual_network" "vn_default" {
  name                = "vn_${var.name}_${local.suffix}"
  location            = var.location
  resource_group_name = var.rgName
  address_space       = [var.vnet_cidr]
  tags = var.tags
}

resource "azurerm_subnet" "sn_default" {
  name                 = "sn_${var.name}_${local.suffix}"
  resource_group_name  = var.rgName
  virtual_network_name = azurerm_virtual_network.vn_default.name
  address_prefixes     = [var.snet_cidr]
}

resource "azurerm_subnet_network_security_group_association" "sn_nsg_assoc" {
  subnet_id                 = azurerm_subnet.sn_default.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
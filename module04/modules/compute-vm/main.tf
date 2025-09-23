resource "azurerm_public_ip" "pip" {
  count               = var.enable_public_ip ? 1 : 0
  name                = "pip_${var.name}_${local.suffix}"
  location            = var.location
  resource_group_name = var.rgName
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  tags               = var.tags
}

resource "azurerm_network_interface" "nic_default" {
  name                = "nic_${var.name}_${local.suffix}"
  location            = var.location
  resource_group_name = var.rgName
  tags               = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.enable_public_ip ? azurerm_public_ip.pip[0].id : null
  }
}

resource "azurerm_linux_virtual_machine" "vm_01" {
  name                = "vm-${var.name}-${local.vmSuffix}"
  resource_group_name = var.rgName
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [azurerm_network_interface.nic_default.id]
  tags = var.tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
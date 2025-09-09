resource "azurerm_network_interface" "nic-default" {
  name                = "nic-${var.base_name}-${local.suffix}"
  location            = var.location
  resource_group_name = var.rgName

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-01" {
  name                = "vm-${var.base_name}-${local.suffix}"
  resource_group_name = var.rgName
  location            = var.location
  size                = "Standard_B1"
  admin_username      = "ivar"
  network_interface_ids = [azurerm_network_interface.nic-default.id]

  admin_ssh_key {
    username   = "admin"
    public_key = file("~/.ssh/id_rsa.pub")
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
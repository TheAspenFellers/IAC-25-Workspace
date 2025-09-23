terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  subscription_id = ""
  features {

  }
}

resource "azurerm_resource_group" "rg-sa" {
  name     = "${var.rgName}-${local.suffix}"
  location = var.location
  tags     = local.tags
}

resource "azurerm_storage_account" "demo-sa" {
  name                     = "${var.saName}0${local.suffix}"
  resource_group_name      = azurerm_resource_group.rg-sa.name
  location                 = azurerm_resource_group.rg-sa.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}
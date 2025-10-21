terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.40"
    }
  }
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "resourceGroup" {
  name     = "${local.rg_name}"
  location = var.location
}

resource "azurerm_storage_account" "storageAccount" {
  name                     = "${local.sa_name}"
  resource_group_name      = azurerm_resource_group.resourceGroup.name
  location                 = azurerm_resource_group.resourceGroup.location
  account_kind             = var.saKind
  account_tier             = var.saTier
  account_replication_type = var.saReplication

  tags = local.tags
}
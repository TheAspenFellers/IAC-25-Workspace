terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "a3adf20e-4966-4afb-b717-4de1baae6db1"
  features {

  }
}


resource "azurerm_resource_group" "rg-sa" {
  name     = "rg-demo-we-ir"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "timdmsdfdsf234wrref"
  resource_group_name      = azurerm_resource_group.rg-sa.name
  location                 = azurerm_resource_group.rg-sa.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.40.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_cli         = true
}

resource "azurerm_resource_group" "fd-rg" {
  name     = "rg-demo-sf34123"
  location = "West Europe"
}
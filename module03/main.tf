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

module "Resource-Group" {
  source    = "./Resource-Group"
  base_name = var.base_name
  location  = var.location
}

module "Network" {
  source   = "./Network"
  rgName   = module.Resource-Group.rg_default_output
  location = var.location

}

module "Virtual-Machine" {
  source    = "./VM"
  rgName    = module.Resource-Group.rg_default_output
  location  = var.location
  base_name = var.base_name
  subnet_id = module.Network.subnet_id_output
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subsciption_id
  features {
  }
}

module "resource-group" {
  source    = "../modules/resource-group"
  name = var.name
  location  = var.location
  tags     = var.tags
  env = var.env
}
 
module "network" {
  source   = "../modules/network"
  name = var.name
  rgName   = module.resource-group.rg_default_output
  location = var.location
  tags     = var.tags
  env = var.env
  vnet_cidr = var.vnet_cidr
  snet_cidr = var.snet_cidr
}

module "virtual-machine" {
  source    = "../modules/compute-vm"
  rgName    = module.resource-group.rg_default_output
  location  = var.location
  name = var.name
  subnet_id = module.network.subnet_id_output
  tags      = var.tags
  env = var.env
  vm_size = var.vm_size
  ssh_public_key_path = var.ssh_public_key_path
  enable_public_ip = var.enable_public_ip
  admin_username = var.admin_username
}
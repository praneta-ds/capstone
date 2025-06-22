terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.79"
    }
  }
  backend "local" {}
}

provider "azurerm" {
  features {}
}

module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = "ss-vnet"
  subnet_name         = "ss-subnet"
}

module "acr" {
  source              = "./modules/acr"
  location            = var.location
  resource_group_name = module.network.resource_group_name
  acr_name            = "ssacr598"
}

module "aks" {
  source              = "./modules/aks"
  location            = var.location
  resource_group_name = module.network.resource_group_name
  aks_name            = "ss-aks-cluster"
  node_count          = 1
  depends_on          = [module.acr]
}

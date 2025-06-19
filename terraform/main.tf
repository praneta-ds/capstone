provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.1.0"
}

#resource "azurerm_resource_group" "existing" {
 # name     = "ss-rg"         # Use your real RG name
  #location = "South India"       # Replace with your VM's region if different
#}

module "acr" {
  source   = "./modules/acr"
  rg_name  = "ss-rg"
  location = "southindia"
}

module "aks" {
  source   = "./modules/aks"
  rg_name  = "ss-rg"
  location = "southindia"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.30.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "41b20900-5acd-4553-902b-502c4c69e934"
}

module "resourcegroup" {
    source = "./modules/resourcegroup"
    name = var.resource_group_name
    location = var.location
}
module "log_analytics" {
  source              = "./modules/loganalytics"
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
module "acr" {
  source = "./modules/acr"
  resource_group_name = var.resource_group_name
  location = var.location
  acr_name = var.acr_name
}
data "azurerm_client_config" "current" {}
module "keyvault" {
  source = "./modules/keyvault"
  rgname = var.resource_group_name
  location = var.location
  name = var.key_vault_name 
  db_server   = module.mysql.sql_server_fqdn
  db_name     = module.mysql.db_name
  db_user     = module.mysql.admin_user
  db_password = module.mysql.admin_password
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  depends_on = [
    module.resourcegroup,
    module.mysql
  ]
}

module "aks" {
    source = "./modules/aks"
    name = var.aks_name
    resource_group_name = var.resource_group_name
    location = var.location
    dns_prefix = var.dns_prefix
    node_count = var.node_count
    vm_size = var.vmsize
    depends_on = [
    module.resourcegroup
  ]
}

module "mysql" {
  source = "./modules/mysql"
  mysql_server_name    = var.mysql_server_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  admin_user           = var.admin_user
  admin_password       = var.admin_password
  db_name              = var.db_name
  depends_on = [
    module.resourcegroup
  ]
}

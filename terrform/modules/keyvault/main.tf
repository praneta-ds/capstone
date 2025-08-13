data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "keyVault" {
  name = var.name
  location = var.location
  resource_group_name = var.rgname
  tenant_id = var.tenant_id
  sku_name = "standard"
  purge_protection_enabled = false
  soft_delete_retention_days = 7
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    secret_permissions = [ "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
  }
  
}



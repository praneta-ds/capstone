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
resource "azurerm_key_vault_secret" "db_server" {
  name         = "DB-SERVER"
  value        = var.db_server
  key_vault_id = azurerm_key_vault.keyVault.id
}

resource "azurerm_key_vault_secret" "db_name" {
  name         = "DB-NAME"
  value        = var.db_name
  key_vault_id = azurerm_key_vault.keyVault.id
}
resource "azurerm_key_vault_secret" "db_user" {
  name         = "DB-USER"
  value        = var.db_user
  key_vault_id = azurerm_key_vault.keyVault.id
}

resource "azurerm_key_vault_secret" "db_password" {
  name         = "DB-PASSWORD"
  value        = var.db_password
  key_vault_id = azurerm_key_vault.keyVault.id
}



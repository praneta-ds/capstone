resource "azurerm_mssql_server" "mysql" {
  name = var.mysql_server_name
  location = var.location
  resource_group_name = var.resource_group_name
  version = 12.0
  administrator_login = var.admin_user
  administrator_login_password = var.admin_password
}


resource "azurerm_mssql_database" "mysql_db" {
  name                = var.db_name
  server_id = azurerm_mssql_server.mysql.id
  sku_name = "S0"
  collation           = var.collation
  max_size_gb = 10
}

resource "azurerm_key_vault_secret" "db_server" {
  name         = "DB_SERVER"
  value        = azurerm_mssql_server.mysql.fully_qualified_domain_name
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "db_name" {
  name         = "DB_NAME"
  value        = azurerm_mssql_database.mysql_db.name
  key_vault_id = var.keyvault_id
}
resource "azurerm_key_vault_secret" "db_user" {
  name         = "DB-USER"
  value        = var.admin_user
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "db_password" {
  name         = "DB-PASSWORD"
  value        = var.admin_password
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "db_server" {
  name         = "DB_SERVER"
  value        = var.admin_password
  key_vault_id = var.keyvault_id
}
resource "azurerm_mysql_flexible_server" "mysql" {
  name = var.mysql_server_name
  location = var.location
  resource_group_name = var.resource_group_name
  sku_name = "B_Gen5_1"
  version = 5.7
  administrator_login = var.admin_user
  administrator_password = var.admin_password
  backup_retention_days = 7
  public_network_access = true

}

resource "azurerm_mysql_flexible_database" "mysql_db" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = var.charset
  collation           = var.collation
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
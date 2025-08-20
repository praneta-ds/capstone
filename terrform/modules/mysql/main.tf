resource "azurerm_mssql_server" "mysql" {
  name = var.mysql_server_name
  location = var.location
  resource_group_name = var.resource_group_name
  version = "12.0"
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




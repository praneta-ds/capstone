output "sql_server_fqdn" {
  value = azurerm_mssql_server.mysql.fully_qualified_domain_name
}

output "db_name" {
  value = azurerm_mssql_database.mysql_db.name
}

output "admin_user" {
  value = var.admin_user
}

output "admin_password" {
  value = var.admin_password
}
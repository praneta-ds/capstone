variable "resource_group_name" {}
variable "location" {}
variable "dns_prefix" {}
variable "node_count" {}
variable "aks_name" {}
variable "vmsize"  {}
variable "account_name" {}
variable "mysql_server_name" {}
variable "admin_user" {}
variable "admin_password" {}
variable "db_name" {}
variable "shard_key" {}
variable "log_analytics_workspace_name" {
  default = "aks-logs-workspace"
}
variable "acr_name" {}
variable "key_vault_name" {
}

variable "secret_name" {
 
}


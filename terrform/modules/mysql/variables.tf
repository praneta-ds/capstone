variable "mysql_server_name" {
  type        = string
  description = "MySQL server name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for MySQL"
}


variable "admin_user" {
  type        = string
  description = "MySQL admin username"
}

variable "admin_password" {
  type        = string
  description = "MySQL admin password"
}

variable "db_name" {
  type        = string
  description = "MySQL database name"
}

variable "charset" {
  type        = string
  default     = "utf8"
}

variable "collation" {
  type        = string
  default     = "utf8_general_ci"
}


variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "keyvault_id" {
  type        = string
  description = "Key Vault ID to store DB secrets"
}

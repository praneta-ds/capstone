output "keyvault_uri" {
  value = azurerm_key_vault.keyVault.vault_uri
}

output "keyvault_id" { value = azurerm_key_vault.keyVault.id }
output "keyvault_name" { value = azurerm_key_vault.keyVault.name }

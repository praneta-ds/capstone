resource "random_integer" "suffix" {
  min = 100
  max = 999
}

resource "azurerm_container_registry" "acr" {
  name                = "ecomacr${random_integer.suffix.result}"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

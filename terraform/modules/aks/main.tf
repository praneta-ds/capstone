resource "azurerm_kubernetes_cluster" "aks" {
  name                = "ss-aks-cluster"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "ssaksdns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
  }

  tags = {
    Environment = "Dev"
  }
}

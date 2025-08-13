resource "azurerm_kubernetes_cluster" "demoaks" {
  name = var.name
  location = var.location
  resource_group_name = var.resource_group_name
  dns_prefix = var.dns_prefix

  default_node_pool {
    name = "default_node_pool"
    node_count = var.node_count
    vm_size = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.2.0.10"
    service_cidr = "10.2.0.0/24"
  }


}
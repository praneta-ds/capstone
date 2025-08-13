output "aks_name" { 
    value = azurerm_kubernetes_cluster.demoaks.name 
    }
output "aks_id" { value = azurerm_kubernetes_cluster.demoaks.id }
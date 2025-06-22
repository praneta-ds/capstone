output "kube_config" {
  value = azurerm_kubernetes_cluster.ss_aks.kube_config_raw
  sensitive = true
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.ss_aks.name
}

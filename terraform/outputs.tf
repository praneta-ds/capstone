output "aks_cluster_name" {
  value = module.aks.aks_name
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

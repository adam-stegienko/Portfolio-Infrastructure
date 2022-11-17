output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
  sensitive = true
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  sensitive = true
}

output "cluster_password" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].password
  sensitive = true
}

output "cluster_username" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].username
  sensitive = true
}

output "host" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].host
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}

output "resource_group_name" {
  value = var.resource_group["name"]
}

output "virtual_network_name" {
  value = var.vnet["name"]
}

output "aks_subnet1_name" {
  value = var.subnets["name"][0]
}

output "aks_subnet2_name" {
  value = var.subnets["name"][1]
}

output "aks_subnet3_name" {
  value = var.subnets["name"][2]
}

output "security_group_name" {
  value = var.sg_name
}
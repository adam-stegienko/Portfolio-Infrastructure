output "client_certificate" {
  value     = module.Kubernetes.client_certificate
  sensitive = true
}

output "client_key" {
  value     = module.Kubernetes.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = module.Kubernetes.cluster_ca_certificate
  sensitive = true
}

output "cluster_password" {
  value     = module.Kubernetes.cluster_password
  sensitive = true
}

output "cluster_username" {
  value     = module.Kubernetes.cluster_username
  sensitive = true
}

output "host" {
  value     = module.Kubernetes.host
  sensitive = true
}

output "kube_config" {
  value     = module.Kubernetes.kube_config
  sensitive = true
}

output "resource_group_name" {
  value = module.Kubernetes.resource_group_name
}

output "virtual_network_name" {
  value = module.Kubernetes.virtual_network_name
}

output "aks_subnet1_name" {
  value = module.Kubernetes.aks_subnet1_name
}

output "aks_subnet2_name" {
  value = module.Kubernetes.aks_subnet2_name
}

output "aks_subnet3_name" {
  value = module.Kubernetes.aks_subnet3_name
}

output "security_group_name" {
  value = module.Kubernetes.security_group_name
}
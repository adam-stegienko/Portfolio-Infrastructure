module "Kubernetes" {
  source = "./Kubernetes"

  cluster_name      = var.cluster_name
  dns_prefix        = var.dns_prefix
  resource_group    = var.resource_group
  ssh_public_key    = var.ssh_public_key
  tags              = var.tags
  default_node_pool = var.default_node_pool
  admin_username    = var.admin_username
  network_profile   = var.network_profile
  service_principal = var.service_principal
  vnet              = var.vnet
  subnet            = var.subnet
  acr               = var.acr
  argocd_chart      = var.argocd_chart
  # root_chart        = var.root_chart
}
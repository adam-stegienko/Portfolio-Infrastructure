module "Kubernetes" {
  source = "./Kubernetes"

  cluster_name      = var.cluster_name
  dns_prefix        = var.dns_prefix
  ssh_public_key    = var.ssh_public_key
  node_pool         = var.node_pool
  admin_username    = var.admin_username
  network_profile   = var.network_profile
  argocd_chart      = var.argocd_chart
  root_chart = var.root_chart
  resource_group    = var.resource_group
  tags              = var.tags
  service_principal = var.service_principal
  vnet              = var.vnet
  subnets           = var.subnets
  acr               = var.acr
  sg_name           = var.sg_name
}
module "Kubernetes" {
  source = "./Kubernetes"

  cluster_name                   = var.cluster_name
  dns_prefix                     = var.dns_prefix
  log_analytics_workspace        = var.log_analytics_workspace
  resource_group                 = var.resource_group
  ssh_public_key                 = var.ssh_public_key
  tags                           = var.tags
  default_node_pool              = var.default_node_pool
  admin_username                 = var.admin_username
  network_profile                = var.network_profile
  service_principal              = var.service_principal
  virtual_network_name           = var.virtual_network_name
  virtual_network_address_prefix = var.virtual_network_address_prefix
  aks_subnet_name                = var.aks_subnet_name
  aks_subnet_address_prefix      = var.aks_subnet_address_prefix
  bootcamp_admin_group_id        = var.bootcamp_admin_group_id
  acr_scope                      = var.acr_scope
}
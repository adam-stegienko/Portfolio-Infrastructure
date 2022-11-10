module "Kubernetes" {
  source = "../Kubernetes"

  # subscription_id                  = var.subscription_id
  # tenant_id                        = var.tenant_id
  # client_id                        = var.client_id
  # client_secret                    = var.client_secret
  cluster_name            = var.cluster_name
  dns_prefix              = var.dns_prefix
  log_analytics_workspace = var.log_analytics_workspace
  resource_group          = var.resource_group
  ssh_public_key          = var.ssh_public_key
  byte_length             = var.byte_length
  tags                    = var.tags
  default_node_pool       = var.default_node_pool
  admin_username          = var.admin_username
  network_profile         = var.network_profile
  service_principal       = var.service_principal
}
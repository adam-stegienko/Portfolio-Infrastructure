resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.rg.location
  name                = var.cluster_name
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  tags                = var.tags

  default_node_pool {
    name       = var.default_node_pool["name"]
    vm_size    = var.default_node_pool["vm_size"]
    node_count = var.default_node_pool["node_count"]
  }
  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
  network_profile {
    network_plugin    = var.network_profile["network_plugin"]
    load_balancer_sku = var.network_profile["load_balancer_sku"]
  }
  service_principal {
    client_id     = var.service_principal["client_id"]
    client_secret = var.service_principal["client_secret"]
  }
}
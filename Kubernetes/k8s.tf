resource "azurerm_kubernetes_cluster" "k8s" {
  name       = var.cluster_name
  location   = var.resource_group["location"]
  dns_prefix = var.dns_prefix

  resource_group_name = var.resource_group["name"]

  role_based_access_control {
    enabled = true
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }

  }

  default_node_pool {
    name           = var.default_node_pool["name"]
    vm_size        = var.default_node_pool["vm_size"]
    node_count     = var.default_node_pool["node_count"]
    vnet_subnet_id = data.azurerm_subnet.adam-subnet.id
  }

  network_profile {
    network_plugin     = var.network_profile["network_plugin"]
    load_balancer_sku  = var.network_profile["load_balancer_sku"]
    dns_service_ip     = var.network_profile["dns_service_ip"]
    docker_bridge_cidr = var.network_profile["docker_bridge_cidr"]
    service_cidr       = var.network_profile["service_cidr"]
  }
  service_principal {
    client_id     = var.service_principal["client_id"]
    client_secret = var.service_principal["client_secret"]
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    azurerm_virtual_network.adam-vnet
  ]

  tags = var.tags
}
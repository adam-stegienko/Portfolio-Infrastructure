resource "azurerm_kubernetes_cluster" "k8s" {
  name       = var.cluster_name
  location   = var.resource_group["location"]
  dns_prefix = var.dns_prefix

  resource_group_name        = var.resource_group["name"]

  role_based_access_control {
    enabled = true
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }
  }

  default_node_pool {
    name           = var.node_pool["name"][0]
    vm_size        = var.node_pool["vm_size"]
    node_count     = var.node_pool["node_count"]
    vnet_subnet_id = data.azurerm_subnet.cluster-subnet1.id
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
    azurerm_virtual_network.cluster-vnet
  ]

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "node-pool2" {
  name                  = var.node_pool["name"][1]
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  vm_size               = var.node_pool["vm_size"]
  node_count            = var.node_pool["node_count"]
  vnet_subnet_id        = data.azurerm_subnet.cluster-subnet2.id
}

resource "azurerm_kubernetes_cluster_node_pool" "node-pool3" {
  name                  = var.node_pool["name"][2]
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  vm_size               = var.node_pool["vm_size"]
  node_count            = var.node_pool["node_count"]
  vnet_subnet_id        = data.azurerm_subnet.cluster-subnet3.id
}

resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "az aks get-credentials --name ${var.cluster_name} --overwrite-existing --resource-group ${var.resource_group["name"]}"
  }

  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]
}

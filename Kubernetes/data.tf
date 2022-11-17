data "azurerm_container_registry" "container-registry" {
  name                = var.acr["name"]
  resource_group_name = var.resource_group["name"]
}

data "azurerm_subnet" "cluster-subnet1" {
  name                 = var.subnets["name"][0]
  virtual_network_name = azurerm_virtual_network.cluster-vnet.name
  resource_group_name  = var.resource_group["name"]
  depends_on           = [azurerm_virtual_network.cluster-vnet]
}

data "azurerm_subnet" "cluster-subnet2" {
  name                 = var.subnets["name"][1]
  virtual_network_name = azurerm_virtual_network.cluster-vnet.name
  resource_group_name  = var.resource_group["name"]
  depends_on           = [azurerm_virtual_network.cluster-vnet]
}

data "azurerm_subnet" "cluster-subnet3" {
  name                 = var.subnets["name"][2]
  virtual_network_name = azurerm_virtual_network.cluster-vnet.name
  resource_group_name  = var.resource_group["name"]
  depends_on           = [azurerm_virtual_network.cluster-vnet]
}

data "azuread_client_config" "current" {}
data "azurerm_container_registry" "container-registry" {
  name                = var.acr["name"]
  resource_group_name = var.resource_group["name"]
}

data "azurerm_subnet" "adam-subnet" {
  name                 = var.subnet["name"]
  virtual_network_name = azurerm_virtual_network.cluster-vnet.name
  resource_group_name  = var.resource_group["name"]
  depends_on           = [azurerm_virtual_network.cluster-vnet]
}
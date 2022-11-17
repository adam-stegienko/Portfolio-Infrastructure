resource "azurerm_virtual_network" "cluster-vnet" {
  name                = var.vnet["name"]
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]
  address_space       = [var.vnet["address_prefix"]]

  subnet {
    name           = var.subnets["name"][0]
    address_prefix = var.subnets["address_prefix"][0]
    security_group = azurerm_network_security_group.cluster-sg-in.id
  }

  subnet {
    name           = var.subnets["name"][1]
    address_prefix = var.subnets["address_prefix"][1]
    security_group = azurerm_network_security_group.cluster-sg-in.id
  }

  subnet {
    name           = var.subnets["name"][2]
    address_prefix = var.subnets["address_prefix"][2]
    security_group = azurerm_network_security_group.cluster-sg-in.id
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    azurerm_network_security_group.cluster-sg-in
  ]
}
resource "azurerm_virtual_network" "cluster-vnet" {
  name                = var.vnet["name"]
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]
  address_space       = [var.vnet["address_prefix"]]

  subnet {
    name           = var.subnet["name"]
    address_prefix = var.subnet["address_prefix"]
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

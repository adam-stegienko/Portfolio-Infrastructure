resource "azurerm_virtual_network" "adam-vnet" {
  name                = var.virtual_network_name
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]
  address_space       = [var.virtual_network_address_prefix]

  subnet {
    name           = var.aks_subnet_name
    address_prefix = var.aks_subnet_address_prefix
  }

  tags = var.tags
}

data "azurerm_subnet" "adam-subnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = azurerm_virtual_network.adam-vnet.name
  resource_group_name  = var.resource_group["name"]
  depends_on           = [azurerm_virtual_network.adam-vnet]
}

resource "azurerm_public_ip" "example" {
  name                = "digital-planner-pip"
  resource_group_name = var.resource_group["name"]
  location            = var.resource_group["location"]
  allocation_method   = "Static"

  tags = var.tags
}
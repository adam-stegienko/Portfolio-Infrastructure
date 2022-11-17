resource "azurerm_network_security_group" "cluster-sg-in" {
  name                = var.sg_name
  location            = var.resource_group["location"]
  resource_group_name = var.resource_group["name"]
}
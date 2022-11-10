resource "azurerm_resource_group" "rg" {
  location = var.resource_group["location"]
  name     = var.resource_group["name"]
}

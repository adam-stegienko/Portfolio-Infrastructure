resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = var.byte_length
}

resource "azurerm_log_analytics_workspace" "adam-log-ws" {
  location            = var.log_analytics_workspace["location"]
  name                = "${var.log_analytics_workspace["name"]}-${random_id.log_analytics_workspace_name_suffix.dec}"
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.log_analytics_workspace["sku"]
}

resource "azurerm_log_analytics_solution" "adam-log-solution" {
  location              = azurerm_log_analytics_workspace.adam-log-ws.location
  resource_group_name   = azurerm_resource_group.rg.name
  solution_name         = "ContainerInsights"
  workspace_name        = azurerm_log_analytics_workspace.adam-log-ws.name
  workspace_resource_id = azurerm_log_analytics_workspace.adam-log-ws.id

  plan {
    product   = "OMSGallery/ContainerInsights"
    publisher = "Microsoft"
  }
}
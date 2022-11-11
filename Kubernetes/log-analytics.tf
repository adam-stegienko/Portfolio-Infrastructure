resource "azurerm_log_analytics_workspace" "adam-log-ws" {
  location            = var.log_analytics_workspace["location"]
  name                = var.log_analytics_workspace["name"]
  resource_group_name = var.resource_group["name"]
  sku                 = var.log_analytics_workspace["sku"]
}

resource "azurerm_log_analytics_solution" "adam-log-solution" {
  location              = azurerm_log_analytics_workspace.adam-log-ws.location
  resource_group_name   = var.resource_group["name"]
  solution_name         = "ContainerInsights"
  workspace_name        = azurerm_log_analytics_workspace.adam-log-ws.name
  workspace_resource_id = azurerm_log_analytics_workspace.adam-log-ws.id

  plan {
    product   = "OMSGallery/ContainerInsights"
    publisher = "Microsoft"
  }
}
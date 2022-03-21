resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = 8
}

locals {
  log_analytics_workspace_name = "${replace(lower(var.resource_group_name), "_", "-")}-analytics-workspace-${random_id.log_analytics_workspace_name_suffix.dec}"
}

resource "azurerm_log_analytics_workspace" "logs" {
  name                = local.log_analytics_workspace_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.log_analytics_workspace_sku
  daily_quota_gb      = var.daily_quota_gb
  retention_in_days   = var.retention_in_days
}

resource "azurerm_log_analytics_solution" "logs" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.logs.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logs.id
  workspace_name        = azurerm_log_analytics_workspace.logs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

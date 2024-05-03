#------------------------------
# azurerm analytics workspace
#------------------------------

resource "azurerm_log_analytics_workspace" "LogAnalytics" {
  count               = var.enable_log_monitoring == true ? 1 : 0
  name                = var.log_analytics_workspace_name
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_days
  tags                = merge(local.default_tags)
}

#---------------------------------
# azurerm monitoring diagnostics
#---------------------------------
resource "azurerm_monitor_diagnostic_setting" "database_extaudit" {
  count                      = var.enable_log_monitoring == true ? 1 : 0
  name                       = lower("extaudit-${var.database_name}-diag")
  target_resource_id         = azurerm_mssql_database.primary.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.LogAnalytics.0.id
  storage_account_id         = azurerm_storage_account.storeacc[0].id

  dynamic "enabled_log" {
    for_each = var.extaudit_diag_logs
    content {
      category = enabled_log.value
    }
  }

  metric {
    category = "AllMetrics"
  }

  lifecycle {
    ignore_changes = [log, metric]
  }
}
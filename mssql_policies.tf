#---------------------------------------------------
# SQL server and database extended auditing policy 
#---------------------------------------------------

resource "azurerm_mssql_server_extended_auditing_policy" "primary" {
  count                                   = var.enable_sql_server_extended_auditing_policy ? 1 : 0
  storage_endpoint                        = azurerm_storage_account.storeacc.0.primary_blob_endpoint
  server_id                               = azurerm_mssql_server.primary.id
  retention_in_days                       = var.log_retention_days
  log_monitoring_enabled                  = var.enable_log_monitoring == true && var.log_analytics_workspace_id != null ? true : false
  storage_account_subscription_id         = data.azurerm_subscription.primary.subscription_id
  storage_account_access_key              = azurerm_storage_account.storeacc.0.primary_access_key
  storage_account_access_key_is_secondary = false

  depends_on = [
    azurerm_role_assignment.storagerole,
    azurerm_storage_account.storeacc,
  ]
}

resource "azurerm_mssql_server_extended_auditing_policy" "secondary" {
  count                                   = var.enable_failover_group && var.enable_sql_server_extended_auditing_policy ? 1 : 0
  storage_endpoint                        = azurerm_storage_account.storeacc.0.primary_blob_endpoint
  server_id                               = azurerm_mssql_server.secondary[count.index].id
  retention_in_days                       = var.log_retention_days
  log_monitoring_enabled                  = var.enable_log_monitoring == true && var.log_analytics_workspace_id != null ? true : false
  storage_account_subscription_id         = data.azurerm_subscription.primary.subscription_id
  storage_account_access_key              = azurerm_storage_account.storeacc.0.primary_access_key
  storage_account_access_key_is_secondary = false

  depends_on = [
    azurerm_role_assignment.storagerole,
    azurerm_storage_account.storeacc,
  ]
}

resource "azurerm_mssql_database_extended_auditing_policy" "primary" {
  count                                   = var.enable_database_extended_auditing_policy ? 1 : 0
  database_id                             = azurerm_mssql_database.primary.id
  storage_endpoint                        = azurerm_storage_account.storeacc.0.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.storeacc.0.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = var.log_retention_days
  log_monitoring_enabled                  = var.enable_log_monitoring == true && var.log_analytics_workspace_id != null ? true : false
}

#-------------------------------------------------------------
# SQL ServerVulnerability assessment and alert to admin team
#-------------------------------------------------------------

resource "azurerm_mssql_server_security_alert_policy" "sap_primary" {
  count                      = var.enable_vulnerability_assessment ? 1 : 0
  resource_group_name        = var.resource_group_name
  server_name                = azurerm_mssql_server.primary.name
  state                      = "Enabled"
  email_account_admins       = true
  email_addresses            = var.email_addresses_for_alerts
  retention_days             = var.threat_detection_audit_logs_retention_days
  disabled_alerts            = var.disabled_alerts
  storage_account_access_key = azurerm_storage_account.storeacc.0.primary_access_key
  storage_endpoint           = azurerm_storage_account.storeacc.0.primary_blob_endpoint
}

resource "azurerm_mssql_server_vulnerability_assessment" "va_primary" {
  count                           = var.enable_vulnerability_assessment ? 1 : 0
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.sap_primary.0.id
  storage_container_path          = "${azurerm_storage_account.storeacc.0.primary_blob_endpoint}${azurerm_storage_container.storcont.0.name}/"
  storage_account_access_key      = azurerm_storage_account.storeacc.0.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails                    = var.email_addresses_for_alerts
  }
}
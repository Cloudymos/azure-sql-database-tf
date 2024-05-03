#-----------------------
# SQL database creation 
#-----------------------

resource "azurerm_mssql_database" "primary" {
  name                                = var.database_name
  server_id                           = azurerm_mssql_server.primary.id
  elastic_pool_id                     = var.elasticpool_enable ? azurerm_mssql_elasticpool.epool-primary.0.id : null
  sku_name                            = var.sku_name
  collation                           = var.collation
  license_type                        = var.license_type
  max_size_gb                         = var.max_size_gb
  maintenance_configuration_name      = var.elasticpool_enable ? null : var.maintenance_configuration_name
  read_scale                          = var.enable_read_scale
  zone_redundant                      = var.enable_zone_redundant
  transparent_data_encryption_enabled = "true"
  storage_account_type                = "Geo"
  geo_backup_enabled                  = "true"
  ledger_enabled                      = var.ledger_enabled

  short_term_retention_policy {
    retention_days           = var.short_term_retention_policy_retention_days
    backup_interval_in_hours = var.short_term_retention_policy_backup_interval_in_hours
  }

  long_term_retention_policy {
    monthly_retention = var.long_term_retention_policy_monthly_retention
  }

  threat_detection_policy {
    state                      = "Enabled"
    storage_endpoint           = azurerm_storage_account.storeacc.0.primary_blob_endpoint
    storage_account_access_key = azurerm_storage_account.storeacc.0.primary_access_key
    retention_days             = var.log_retention_days
    email_addresses            = var.email_addresses_for_alerts
  }
  tags = merge(local.default_tags)
}

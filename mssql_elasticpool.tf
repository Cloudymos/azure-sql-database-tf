resource "azurerm_mssql_elasticpool" "epool-primary" {
  count               = var.elasticpool_enable ? 1 : 0
  name                = "${var.sqlserver_name}-epool-primary"
  resource_group_name = var.resource_group_name
  location            = var.primary_sql_server_location
  server_name         = azurerm_mssql_server.primary.name
  zone_redundant      = true
  license_type        = var.elasticpool_license_type
  max_size_gb         = var.elasticpool_max_size_gb

  tags = merge(local.default_tags)

  sku {
    name     = var.elasticpool_sku
    tier     = var.elasticpool_tier
    family   = var.elasticpool_family
    capacity = var.elasticpool_capacity
  }

  per_database_settings {
    min_capacity = var.elasticpool_per_database_settings_min
    max_capacity = var.elasticpool_per_database_settings_max
  }
}

resource "azurerm_mssql_elasticpool" "epool-secondary" {
  count               = var.secondary_database_name != null && var.elasticpool_enable && var.enable_failover_group ? 1 : 0
  name                = "${var.sqlserver_name}-epool-secondary"
  resource_group_name = var.resource_group_name
  location            = var.secondary_sql_server_location
  server_name         = azurerm_mssql_server.secondary.0.name
  zone_redundant      = true
  license_type        = var.elasticpool_license_type
  max_size_gb         = var.elasticpool_max_size_gb

  tags = merge(local.default_tags)

  sku {
    name     = var.elasticpool_sku
    tier     = var.elasticpool_tier
    family   = var.elasticpool_family
    capacity = var.elasticpool_capacity
  }

  per_database_settings {
    min_capacity = var.elasticpool_per_database_settings_min
    max_capacity = var.elasticpool_per_database_settings_max
  }
}
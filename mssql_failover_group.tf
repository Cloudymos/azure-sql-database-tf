#--------------------------
# Azure SQL Failover Group 
#--------------------------

resource "azurerm_mssql_failover_group" "fog" {
  count     = var.enable_failover_group && var.elasticpool_enable != true ? 1 : 0
  name      = var.sql_failover_group_name
  server_id = azurerm_mssql_server.primary.id
  databases = [azurerm_mssql_database.primary.id]

  partner_server {
    id = azurerm_mssql_server.secondary.0.id
  }

  read_write_endpoint_failover_policy {
    mode          = var.sql_read_write_endpoint_failover_policys
    grace_minutes = var.sql_read_write_endpoint_failover_policys == "Automatic" ? var.sql_grace_minutes : null
  }

  readonly_endpoint_failover_policy_enabled = true

  tags = merge(local.default_tags)

}

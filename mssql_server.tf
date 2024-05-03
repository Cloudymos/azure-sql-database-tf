data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {
}

resource "random_password" "main" {
  length      = var.random_password_length
  min_upper   = 4
  min_lower   = 2
  min_numeric = 4
  special     = false

  keepers = {
    administrator_login_password = var.sqlserver_name
  }
}

#----------------------
# SQL Server creation 
#----------------------

resource "azurerm_mssql_server" "primary" {
  name                          = var.sqlserver_name
  resource_group_name           = var.resource_group_name
  location                      = var.primary_sql_server_location
  version                       = "12.0"
  administrator_login           = var.admin_username == null ? "snickers" : var.admin_username
  administrator_login_password  = var.admin_password == null ? random_password.main.result : var.admin_password
  minimum_tls_version           = "1.2"
  public_network_access_enabled = var.public_network_access_enabled
  identity {
    type         = var.userassigned_identity_ids != null ? "UserAssigned" : "SystemAssigned"
    identity_ids = var.userassigned_identity_ids != null ? var.userassigned_identity_ids : []
  }
  
  primary_user_assigned_identity_id = var.userassigned_identity_ids != null ? var.userassigned_identity_ids[0] : null
  
  azuread_administrator {
    login_username              = data.azuread_group.sqlADGroup.display_name
    object_id                   = data.azuread_group.sqlADGroup.object_id
    azuread_authentication_only = var.azuread_authentication_only
  }
  tags = merge(local.default_tags)
}

resource "azurerm_role_assignment" "storagerole" {
  count                = var.enable_log_monitoring && var.userassigned_identity_ids == null ? 1 : 0
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Log Analytics Contributor"
  principal_id         = azurerm_mssql_server.primary.identity[0].principal_id

  depends_on = [ azurerm_mssql_server.primary ]
}

resource "azurerm_mssql_server" "secondary" {
  count                         = var.enable_failover_group ? 1 : 0
  name                          = "${var.sqlserver_name}2"
  resource_group_name           = var.resource_group_name
  location                      = var.secondary_sql_server_location
  version                       = "12.0"
  administrator_login           = var.admin_username == null ? "snickers" : var.admin_username
  administrator_login_password  = var.admin_password == null ? random_password.main.result : var.admin_password
  minimum_tls_version           = "1.2"
  public_network_access_enabled = var.public_network_access_enabled
  identity {
    type         = var.userassigned_identity_ids != null ? "UserAssigned" : "SystemAssigned"
    identity_ids = var.userassigned_identity_ids != null ? var.userassigned_identity_ids : []
  }
  
  primary_user_assigned_identity_id = var.userassigned_identity_ids != null ? var.userassigned_identity_ids[0] : null

  azuread_administrator {
    login_username              = data.azuread_group.sqlADGroup.display_name
    object_id                   = data.azuread_group.sqlADGroup.object_id
    azuread_authentication_only = var.azuread_authentication_only
  }
  depends_on = [
    azurerm_mssql_server.primary
  ]
  tags = merge(local.default_tags)
}
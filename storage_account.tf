
#-------------------------------------
# Storage Account to keep Audit logs 
#-------------------------------------

resource "random_string" "str" {
  count   = var.enable_sql_server_extended_auditing_policy || var.enable_database_extended_auditing_policy || var.enable_vulnerability_assessment ? 1 : 0
  length  = 6
  special = false
  upper   = false
  keepers = {
    name = var.storage_account_name
  }
}

resource "azurerm_storage_account" "storeacc" {
  count                     = var.enable_threat_detection_policy || var.enable_sql_server_extended_auditing_policy || var.enable_database_extended_auditing_policy || var.enable_vulnerability_assessment || var.enable_log_monitoring == true ? 1 : 0
  name                      = var.storage_account_name == null ? "stssqllogs${element(concat(random_string.str.*.result, [""]), 0)}" : substr(var.storage_account_name, 0, 24)
  resource_group_name       = var.resource_group_name
  location                  = var.primary_sql_server_location
  account_kind              = var.storage_account_kind
  account_tier              = var.storage_account_tier
  account_replication_type  = var.storage_account_replication_type
  enable_https_traffic_only = var.storage_account_enable_https_traffic_only
  min_tls_version           = var.storage_account_min_tls_version

  dynamic "network_rules" {
    for_each = var.network_rules_default_action != null ? [1] : []
    content {
      default_action             = var.network_rules_default_action
      ip_rules                   = var.network_rules_ip_rules
      virtual_network_subnet_ids = var.network_rules_virtual_network_subnet_ids
      bypass                     = var.network_rules_bypass
    }
  }

  tags = merge(local.default_tags)

}

resource "azurerm_storage_container" "storcont" {
  count                 = var.enable_vulnerability_assessment ? 1 : 0
  name                  = "vulnerability-assessment"
  storage_account_name  = azurerm_storage_account.storeacc[0].name
  container_access_type = "private"
}
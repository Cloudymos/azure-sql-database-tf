module "azure_database" {
  source = "github.com/Cloudymos/azure-sql-database-tf"

  # Resource groups
  resource_group_name = "mssql-primary-db-rg"
  secondary_resource_group_name = "mssql-secondary-db-rg"

  # Server variables
  sqlserver_name = "mssql-server-poc"
  primary_sql_server_location = "East US"
  secondary_sql_server_location = "West US"
  admin_username = "useradm"
  admin_password = "P@ssw0rd1234"
  azuread_authentication_only = false
  ad_group_admin_login_name = "DB-Admin"
  enable_log_monitoring        = true
  log_analytics_workspace_name = "poc-log-analytics-workspace"
  log_analytics_workspace_sku  = "PerGB2018"
  log_retention_days           = 30
  extaudit_diag_logs           = ["QueryStoreRuntimeStatistics", "QueryStoreWaitStatistics"]
  enable_failover_group = true
  sql_failover_group_name = "sqlserver-example-fg"
  sql_read_write_endpoint_failover_policys = "Automatic"
  sql_grace_minutes = 80

  # Elastic pool variables
#   elasticpool_enable = true
#   elasticpool_license_type = "LicenseIncluded"
#   elasticpool_max_size_gb = 400
#   elasticpool_sku = "GP_Gen5"
#   elasticpool_tier = "GeneralPurpose"
#   elasticpool_family = "Gen5"
#   elasticpool_capacity = 4
#   elasticpool_per_database_settings_min = 0.5
#   elasticpool_per_database_settings_max = 4

  # Database variables
  database_name = "my-database"
  sku_name = "P2"
  collation = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb = 5
  maintenance_configuration_name = "SQL_Default"
  enable_read_scale = false
  enable_zone_redundant = true
  ledger_enabled = false
  short_term_retention_policy_retention_days = 7
  short_term_retention_policy_backup_interval_in_hours = 24
  long_term_retention_policy_monthly_retention = "P1M"

  # Security policies
  enable_sql_server_extended_auditing_policy = true
  enable_database_extended_auditing_policy = true
  enable_vulnerability_assessment = true
  enable_threat_detection_policy = true

  # Threat detection
  threat_detection_audit_logs_retention_days = 180

  # Email addresses for alerts
  email_addresses_for_alerts = ["email1@example.com", "email2@example.com"]

  # Disabled alerts
  disabled_alerts = ["Data_Exfiltration"]
}

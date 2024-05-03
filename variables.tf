# --------------------------
# Authentication variables
# --------------------------

variable "arm_client_id" {}

variable "arm_client_secret" {}

variable "arm_tenant_id" {}

variable "subscription_id" {}

#-----------------
# Variable tags
#-----------------

/*** Default Tags ***/
variable "tag_project" {
  description = "Name of the project to which these resources are associated."
  type        = string
  default     = "default_project"
}

variable "tag_environment" {
  description = "Environment in which the resources are deployed, such as production, testing, QA, etc."
  type        = string
  default     = "default_environment"
}

variable "tag_owner" {
  description = "The name or identification of the person or team creating or managing these resources."
  type        = string
  default     = "default_owner"
}


#-----------------
# Code variables
#-----------------

# -----------------------------
# STORAGE ACCOUNT VARIABLES 
# -----------------------------
variable "storage_account_name" {
  description = "The name of the storage account name"
  default     = null
}

variable "storage_account_kind" {
  description = "Specifies the kind of storage account."
  type        = string
  default     = "StorageV2"
}

variable "storage_account_tier" {
  description = "Specifies the storage account tier."
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Specifies the type of replication to use for the storage account."
  type        = string
  default     = "GRS"
}

variable "storage_account_enable_https_traffic_only" {
  description = "Specifies whether HTTPS traffic only is enabled for the storage account."
  type        = bool
  default     = true
}

variable "storage_account_min_tls_version" {
  description = "Specifies the minimum TLS version to use for the storage account."
  type        = string
  default     = "TLS1_2"
}

variable "network_rules_default_action" {
  description = "The default action for network rules."
  type        = string
  default     = null
}

variable "network_rules_ip_rules" {
  description = "List of IP addresses or ranges to allow for network rules."
  type        = list(string)
  default     = null
}

variable "network_rules_virtual_network_subnet_ids" {
  description = "List of virtual network subnet IDs to allow for network rules."
  type        = list(string)
  default     = null
}

variable "network_rules_bypass" {
  description = "List of bypass options for network rules."
  type        = list(string)
  default     = null
}

# ----------------------------------------------------------------------------------------------------

variable "random_password_length" {
  description = "The desired length of random password created by this module"
  default     = 32
}

variable "sqlserver_name" {
  description = "(Required) The name of the Microsoft SQL Server. This needs to be globally unique within Azure"
  default     = null
}

variable "database_name" {
  description = "(Required) The name of the MS SQL Database. Changing this forces a new resource to be created."
}

variable "secondary_database_name" {
  description = "(Optional) The name of the MS SQL Database. Changing this forces a new resource to be created."
  default     = null
}

variable "admin_username" {
  description = "The administrator login name for the new SQL Server"
  default     = "snickers"
}

variable "admin_password" {
  description = "The password associated with the admin_username user"
  default     = null
}

variable "userassigned_identity_ids" {
  description = "**OPTIONAL**: User assigned to be added on sql server in format: /subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.ManagedIdentity/userAssignedIdentities/userAssignedIdentityValue"
  type        = list(string)
  default     = null
}

variable "enable_sql_server_extended_auditing_policy" {
  description = "Manages Extended Audit policy for SQL servers"
  default     = false
}

variable "enable_database_extended_auditing_policy" {
  description = "Manages Extended Audit policy for SQL database"
  default     = false
}

variable "enable_vulnerability_assessment" {
  description = "Manages the Vulnerability Assessment for a MS SQL Server"
  default     = false
}

variable "enable_log_monitoring" {
  description = "Enable audit events to Azure Monitor?"
  default     = false
}

variable "log_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs"
  default     = "30"
}

variable "log_analytics_workspace_id" {
  description = "Specifies the ID of a Log Analytics Workspace where Diagnostics Data to be sent"
  default     = null
}

variable "log_analytics_workspace_name" {
  description = "(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
  default     = null
}

variable "log_analytics_workspace_sku" {
  description = "Specifies the ID of a Log Analytics Workspace where Diagnostics Data to be sent"
  default     = "PerGB2018"
}

variable "enable_failover_group" {
  description = "Create a failover group of databases on a collection of Azure SQL servers"
  default     = true
}

variable "sql_failover_group_name" {
  description = "(Required) The name of the Failover Group. Changing this forces a new resource to be created.'"
  default     = null
}

variable "sql_read_write_endpoint_failover_policys" {
  description = "(Required) The failover policy of the read-write endpoint for the failover group. Possible values are Automatic or Manual"
  default     = "Automatic"
}

variable "sql_grace_minutes" {
  description = "Applies only if mode is Automatic. The grace period in minutes before failover with data loss is attempted"
  default     = 60
}

variable "email_addresses_for_alerts" {
  description = "A list of email addresses which alerts should be sent to."
  type        = list(any)
  default     = []
}

variable "threat_detection_audit_logs_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs."
  default     = 0
}

variable "disabled_alerts" {
  description = "Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action."
  type        = list(any)
  default     = []
}

variable "enable_firewall_rules" {
  description = "Manage an Azure SQL Firewall Rule"
  default     = true
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
}

variable "secondary_resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
}

variable "enable_threat_detection_policy" {
  description = "Enable Azure Defender for database"
  default     = true
}

variable "primary_sql_server_location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "secondary_sql_server_location" {
  description = "Specifies the supported Azure location to create secondary sql server resource"
  default     = null
}

variable "storage_account_id" {
  description = "The name of the storage account to store the all monitoring logs"
  default     = null
}

variable "extaudit_diag_logs" {
  description = "Database Monitoring Category details for Azure Diagnostic setting"
  default     = []
}

variable "existing_private_dns_zone" {
  description = "Name of the existing private DNS zone"
  default     = null
}

variable "collation" {
  description = "(Optional) Specifies the collation of the database. Changing this forces a new resource to be created."
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "sku_name" {
  type        = string
  description = "(Optional) Specifies the name of the SKU used by the database. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. Changing this from the HyperScale service tier to another service tier will force a new resource to be created."
  validation {
    condition     = !contains(["Basic"], var.sku_name)
    error_message = "Valid values for var: sku_name are (GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool,S0, P2 ,DW100c, DS100.)."
  }
}

variable "license_type" {
  description = "(Optional) Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice"
  default     = "LicenseIncluded"
}

variable "enable_read_scale" {
  description = "(Optional) If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases."
  default     = false
}

variable "enable_zone_redundant" {
  description = "(Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
  default     = false
}

variable "maintenance_configuration_name" {
  description = "(Optional) The name of the Public Maintenance Configuration window to apply to the database. Valid values include SQL_Default, SQL_EastUS_DB_1, SQL_EastUS2_DB_1, SQL_SoutheastAsia_DB_1, SQL_AustraliaEast_DB_1, SQL_NorthEurope_DB_1, SQL_SouthCentralUS_DB_1, SQL_WestUS2_DB_1, SQL_UKSouth_DB_1, SQL_WestEurope_DB_1, SQL_EastUS_DB_2, SQL_EastUS2_DB_2, SQL_WestUS2_DB_2, SQL_SoutheastAsia_DB_2, SQL_AustraliaEast_DB_2, SQL_NorthEurope_DB_2, SQL_SouthCentralUS_DB_2, SQL_UKSouth_DB_2, SQL_WestEurope_DB_2, SQL_AustraliaSoutheast_DB_1, SQL_BrazilSouth_DB_1, SQL_CanadaCentral_DB_1, SQL_CanadaEast_DB_1, SQL_CentralUS_DB_1, SQL_EastAsia_DB_1, SQL_FranceCentral_DB_1, SQL_GermanyWestCentral_DB_1, SQL_CentralIndia_DB_1, SQL_SouthIndia_DB_1, SQL_JapanEast_DB_1, SQL_JapanWest_DB_1, SQL_NorthCentralUS_DB_1, SQL_UKWest_DB_1, SQL_WestUS_DB_1, SQL_AustraliaSoutheast_DB_2, SQL_BrazilSouth_DB_2, SQL_CanadaCentral_DB_2, SQL_CanadaEast_DB_2, SQL_CentralUS_DB_2, SQL_EastAsia_DB_2, SQL_FranceCentral_DB_2, SQL_GermanyWestCentral_DB_2, SQL_CentralIndia_DB_2, SQL_SouthIndia_DB_2, SQL_JapanEast_DB_2, SQL_JapanWest_DB_2, SQL_NorthCentralUS_DB_2, SQL_UKWest_DB_2, SQL_WestUS_DB_2, SQL_WestCentralUS_DB_1, SQL_FranceSouth_DB_1, SQL_WestCentralUS_DB_2, SQL_FranceSouth_DB_2, SQL_SwitzerlandNorth_DB_1, SQL_SwitzerlandNorth_DB_2, SQL_BrazilSoutheast_DB_1, SQL_UAENorth_DB_1, SQL_BrazilSoutheast_DB_2, SQL_UAENorth_DB_2. Defaults to SQL_Default."
  default     = "SQL_Default"
}

variable "ledger_enabled" {
  description = "(Optional) A boolean that specifies if this is a ledger database. Defaults to false. Changing this forces a new resource to be created."
  default     = false
}

variable "short_term_retention_policy_retention_days" {
  description = "(Required) Point In Time Restore configuration. Value has to be between 7 and 35"
  default     = 35
}

variable "short_term_retention_policy_backup_interval_in_hours" {
  description = " (Optional) The hours between each differential backup. This is only applicable to live databases but not dropped databases. Value has to be 12 or 24. Defaults to 12 hours."
  default     = 12
}

variable "long_term_retention_policy_monthly_retention" {
  description = "(Optional) The monthly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D."
  default     = "P1M"
}

variable "ad_group_admin_login_name" {
  description = "(Required) The login name of the principal to set as the Managed Instance Administrator."
  default     = null
}

variable "public_network_access_enabled" {
  description = "(Optional) Whether public network access is allowed for this server. Defaults to true."
  default     = true
}

variable "azuread_authentication_only" {
  description = "(Optional) Specifies whether only AD Users and administrators (like azuread_administrator.0.login_username) can be used to login, or also local database users (like administrator_login). When true, the administrator_login and administrator_login_password properties can be omitted."
  default     = false
}

variable "max_size_gb" {
  description = "(Optional) The max size of the database in gigabytes."
  default     = 100
}

variable "elasticpool_enable" {
  description = "(Optional) Allows you to manage an Azure SQL Elastic Pool via the v3.0 API which allows for vCore and DTU based configurations"
  default     = false
}

variable "elasticpool_max_size_gb" {
  description = "(Optional) The max data size of the elastic pool in gigabytes. Conflicts with max_size_bytes"
  default     = 100
}

variable "elasticpool_license_type" {
  description = "(Optional) Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice"
  default     = "LicenseIncluded"
}

variable "elasticpool_sku" {
  type        = string
  description = "(Required) Specifies the SKU Name for this Elasticpool. The name of the SKU, will be either vCore based tier + family pattern (e.g. GP_Gen4, BC_Gen5) or the DTU based BasicPool, StandardPool, or PremiumPool pattern."
  default     = "GP_Gen5"

  validation {
    condition     = !contains(["BasicPool"], var.elasticpool_sku)
    error_message = "Valid values for var: elasticpool_sku are (vCore based tier + family pattern, StandardPool, PremiumPool)."
  }
}

variable "elasticpool_tier" {
  type        = string
  description = "(Required) The tier of the particular SKU. Possible values are GeneralPurpose, BusinessCritical, Basic, Standard, or Premium."
  default     = "GeneralPurpose"
  validation {
    condition     = contains(["GeneralPurpose", "BusinessCritical", "Standard", "Premium"], var.elasticpool_tier)
    error_message = "Valid values for var: elasticpool_tier are (GeneralPurpose, BusinessCritical, Standard, Premium)."
  }
}

variable "elasticpool_family" {
  description = "(Required) The tier of the particular SKU. Possible values are GeneralPurpose, BusinessCritical, Basic, Standard, or Premium."
  default     = "Gen5"
}

variable "elasticpool_capacity" {
  description = "(Required) The scale up/out capacity, representing server's compute units. For more information see the documentation for your Elasticpool configuration: vCore-based or DTU-based."
  default     = 2
}

variable "elasticpool_per_database_settings_min" {
  description = "(Required) The minimum capacity all databases are guaranteed."
  default     = 0
}

variable "elasticpool_per_database_settings_max" {
  description = "(Required) The maximum capacity any one database can consume."
  default     = 2
}
# Azure Database Module

## Overview

This module provisions resources related to Azure Database, including SQL Server, databases, failover groups, firewall rules, security policies, diagnostics, and more. It automates the configuration and management of these resources, making it easy to create and test database environments in Azure. **For additional resources, examples, and community engagement**, check out the portal [Cloudymos](https://cloudymos.com) :cloud:.

## Features

- Provisioning of SQL Server and SQL databases in Azure
- Configuration of failover groups for high availability
- Definition of firewall rules for access control
- Security policies for extended auditing and vulnerability assessment
- Configuration of diagnostics and monitoring
- Use of Private Endpoints for secure private connection
- Creation of networking resources (VNet, subnets) and virtual machines with SQL Server Management Studio (SSMS) installed for validation

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.99.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.LogAnalytics](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_diagnostic_setting.database_extaudit](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_mssql_database.primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_database) | resource |
| [azurerm_mssql_database_extended_auditing_policy.primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_database_extended_auditing_policy) | resource |
| [azurerm_mssql_elasticpool.epool-primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_elasticpool) | resource |
| [azurerm_mssql_elasticpool.epool-secondary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_elasticpool) | resource |
| [azurerm_mssql_failover_group.fog](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_failover_group) | resource |
| [azurerm_mssql_firewall_rule.fw01](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server.secondary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_extended_auditing_policy.secondary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_security_alert_policy.sap_primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_server_security_alert_policy) | resource |
| [azurerm_mssql_server_vulnerability_assessment.va_primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/mssql_server_vulnerability_assessment) | resource |
| [azurerm_network_interface.nic_example1](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic_example2](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.nsg_association_nic1](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nsg_association_nic2](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.example_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/network_security_group) | resource |
| [azurerm_private_dns_zone.dnszone1](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.sqlserver_vnl](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.pep1](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/private_endpoint) | resource |
| [azurerm_public_ip.example_public_ip1](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip.example_public_ip2](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/public_ip) | resource |
| [azurerm_role_assignment.storagerole](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/role_assignment) | resource |
| [azurerm_route_table.example_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/route_table) | resource |
| [azurerm_storage_account.storeacc](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.storcont](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/storage_container) | resource |
| [azurerm_subnet.subnet_example](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/subnet) | resource |
| [azurerm_subnet.subnet_example2](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/subnet) | resource |
| [azurerm_subnet_route_table_association.example_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_machine_extension.ssms_install_extension_vm1](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.ssms_install_extension_vm2](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_network.vnet_example](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/virtual_network) | resource |
| [azurerm_windows_virtual_machine.vm_example1](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/windows_virtual_machine) | resource |
| [azurerm_windows_virtual_machine.vm_example2](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/resources/windows_virtual_machine) | resource |
| [random_password.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.str](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azuread_group.sqlADGroup](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/data-sources/client_config) | data source |
| [azurerm_private_dns_a_record.sqlserver_a_record](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/data-sources/private_dns_a_record) | data source |
| [azurerm_subscription.primary](https://registry.terraform.io/providers/hashicorp/azurerm/3.99.0/docs/data-sources/subscription) | data source |

## Usage

This module is mainly intended for study or testing purposes of the covered functionalities. It can be used to create development environments, demonstrations, or prototypes of applications using Azure Database.

### Usage Example

```hcl
WIP ...
```

### Validation

To validate secure database access, this module creates two virtual machines:

- One in a subnet with a Private Endpoint configured for secure access to the database.
- Another in a subnet without a Private Endpoint, to validate public access.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_group_admin_login_name"></a> [ad\_group\_admin\_login\_name](#input\_ad\_group\_admin\_login\_name) | (Required) The login name of the principal to set as the Managed Instance Administrator. | `any` | `null` | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The password associated with the admin\_username user | `any` | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The administrator login name for the new SQL Server | `string` | `"snickers"` | no |
| <a name="input_arm_client_id"></a> [arm\_client\_id](#input\_arm\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_arm_client_secret"></a> [arm\_client\_secret](#input\_arm\_client\_secret) | n/a | `any` | n/a | yes |
| <a name="input_arm_tenant_id"></a> [arm\_tenant\_id](#input\_arm\_tenant\_id) | n/a | `any` | n/a | yes |
| <a name="input_azuread_authentication_only"></a> [azuread\_authentication\_only](#input\_azuread\_authentication\_only) | (Optional) Specifies whether only AD Users and administrators (like azuread\_administrator.0.login\_username) can be used to login, or also local database users (like administrator\_login). When true, the administrator\_login and administrator\_login\_password properties can be omitted. | `bool` | `false` | no |
| <a name="input_collation"></a> [collation](#input\_collation) | (Optional) Specifies the collation of the database. Changing this forces a new resource to be created. | `string` | `"SQL_Latin1_General_CP1_CI_AS"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | (Required) The name of the MS SQL Database. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_disabled_alerts"></a> [disabled\_alerts](#input\_disabled\_alerts) | Specifies an array of alerts that are disabled. Allowed values are: Sql\_Injection, Sql\_Injection\_Vulnerability, Access\_Anomaly, Data\_Exfiltration, Unsafe\_Action. | `list(any)` | `[]` | no |
| <a name="input_elasticpool_capacity"></a> [elasticpool\_capacity](#input\_elasticpool\_capacity) | (Required) The scale up/out capacity, representing server's compute units. For more information see the documentation for your Elasticpool configuration: vCore-based or DTU-based. | `number` | `2` | no |
| <a name="input_elasticpool_enable"></a> [elasticpool\_enable](#input\_elasticpool\_enable) | (Optional) Allows you to manage an Azure SQL Elastic Pool via the v3.0 API which allows for vCore and DTU based configurations | `bool` | `false` | no |
| <a name="input_elasticpool_family"></a> [elasticpool\_family](#input\_elasticpool\_family) | (Required) The tier of the particular SKU. Possible values are GeneralPurpose, BusinessCritical, Basic, Standard, or Premium. | `string` | `"Gen5"` | no |
| <a name="input_elasticpool_license_type"></a> [elasticpool\_license\_type](#input\_elasticpool\_license\_type) | (Optional) Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice | `string` | `"LicenseIncluded"` | no |
| <a name="input_elasticpool_max_size_gb"></a> [elasticpool\_max\_size\_gb](#input\_elasticpool\_max\_size\_gb) | (Optional) The max data size of the elastic pool in gigabytes. Conflicts with max\_size\_bytes | `number` | `100` | no |
| <a name="input_elasticpool_per_database_settings_max"></a> [elasticpool\_per\_database\_settings\_max](#input\_elasticpool\_per\_database\_settings\_max) | (Required) The maximum capacity any one database can consume. | `number` | `2` | no |
| <a name="input_elasticpool_per_database_settings_min"></a> [elasticpool\_per\_database\_settings\_min](#input\_elasticpool\_per\_database\_settings\_min) | (Required) The minimum capacity all databases are guaranteed. | `number` | `0` | no |
| <a name="input_elasticpool_sku"></a> [elasticpool\_sku](#input\_elasticpool\_sku) | (Required) Specifies the SKU Name for this Elasticpool. The name of the SKU, will be either vCore based tier + family pattern (e.g. GP\_Gen4, BC\_Gen5) or the DTU based BasicPool, StandardPool, or PremiumPool pattern. | `string` | `"GP_Gen5"` | no |
| <a name="input_elasticpool_tier"></a> [elasticpool\_tier](#input\_elasticpool\_tier) | (Required) The tier of the particular SKU. Possible values are GeneralPurpose, BusinessCritical, Basic, Standard, or Premium. | `string` | `"GeneralPurpose"` | no |
| <a name="input_email_addresses_for_alerts"></a> [email\_addresses\_for\_alerts](#input\_email\_addresses\_for\_alerts) | A list of email addresses which alerts should be sent to. | `list(any)` | `[]` | no |
| <a name="input_enable_database_extended_auditing_policy"></a> [enable\_database\_extended\_auditing\_policy](#input\_enable\_database\_extended\_auditing\_policy) | Manages Extended Audit policy for SQL database | `bool` | `false` | no |
| <a name="input_enable_failover_group"></a> [enable\_failover\_group](#input\_enable\_failover\_group) | Create a failover group of databases on a collection of Azure SQL servers | `bool` | `true` | no |
| <a name="input_enable_firewall_rules"></a> [enable\_firewall\_rules](#input\_enable\_firewall\_rules) | Manage an Azure SQL Firewall Rule | `bool` | `true` | no |
| <a name="input_enable_log_monitoring"></a> [enable\_log\_monitoring](#input\_enable\_log\_monitoring) | Enable audit events to Azure Monitor? | `bool` | `false` | no |
| <a name="input_enable_read_scale"></a> [enable\_read\_scale](#input\_enable\_read\_scale) | (Optional) If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases. | `bool` | `false` | no |
| <a name="input_enable_sql_server_extended_auditing_policy"></a> [enable\_sql\_server\_extended\_auditing\_policy](#input\_enable\_sql\_server\_extended\_auditing\_policy) | Manages Extended Audit policy for SQL servers | `bool` | `false` | no |
| <a name="input_enable_threat_detection_policy"></a> [enable\_threat\_detection\_policy](#input\_enable\_threat\_detection\_policy) | Enable Azure Defender for database | `bool` | `true` | no |
| <a name="input_enable_vulnerability_assessment"></a> [enable\_vulnerability\_assessment](#input\_enable\_vulnerability\_assessment) | Manages the Vulnerability Assessment for a MS SQL Server | `bool` | `false` | no |
| <a name="input_enable_zone_redundant"></a> [enable\_zone\_redundant](#input\_enable\_zone\_redundant) | (Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases. | `bool` | `false` | no |
| <a name="input_existing_private_dns_zone"></a> [existing\_private\_dns\_zone](#input\_existing\_private\_dns\_zone) | Name of the existing private DNS zone | `any` | `null` | no |
| <a name="input_extaudit_diag_logs"></a> [extaudit\_diag\_logs](#input\_extaudit\_diag\_logs) | Database Monitoring Category details for Azure Diagnostic setting | `list` | `[]` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Range of IP addresses to allow firewall connections. | <pre>list(object({<br>    name             = string<br>    start_ip_address = string<br>    end_ip_address   = string<br>  }))</pre> | `[]` | no |
| <a name="input_ledger_enabled"></a> [ledger\_enabled](#input\_ledger\_enabled) | (Optional) A boolean that specifies if this is a ledger database. Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | (Optional) Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice | `string` | `"LicenseIncluded"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Specifies the ID of a Log Analytics Workspace where Diagnostics Data to be sent | `any` | `null` | no |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | (Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created. | `any` | `null` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Specifies the ID of a Log Analytics Workspace where Diagnostics Data to be sent | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | Specifies the number of days to keep in the Threat Detection audit logs | `string` | `"30"` | no |
| <a name="input_long_term_retention_policy_monthly_retention"></a> [long\_term\_retention\_policy\_monthly\_retention](#input\_long\_term\_retention\_policy\_monthly\_retention) | (Optional) The monthly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D. | `string` | `"P1M"` | no |
| <a name="input_maintenance_configuration_name"></a> [maintenance\_configuration\_name](#input\_maintenance\_configuration\_name) | (Optional) The name of the Public Maintenance Configuration window to apply to the database. Valid values include SQL\_Default, SQL\_EastUS\_DB\_1, SQL\_EastUS2\_DB\_1, SQL\_SoutheastAsia\_DB\_1, SQL\_AustraliaEast\_DB\_1, SQL\_NorthEurope\_DB\_1, SQL\_SouthCentralUS\_DB\_1, SQL\_WestUS2\_DB\_1, SQL\_UKSouth\_DB\_1, SQL\_WestEurope\_DB\_1, SQL\_EastUS\_DB\_2, SQL\_EastUS2\_DB\_2, SQL\_WestUS2\_DB\_2, SQL\_SoutheastAsia\_DB\_2, SQL\_AustraliaEast\_DB\_2, SQL\_NorthEurope\_DB\_2, SQL\_SouthCentralUS\_DB\_2, SQL\_UKSouth\_DB\_2, SQL\_WestEurope\_DB\_2, SQL\_AustraliaSoutheast\_DB\_1, SQL\_BrazilSouth\_DB\_1, SQL\_CanadaCentral\_DB\_1, SQL\_CanadaEast\_DB\_1, SQL\_CentralUS\_DB\_1, SQL\_EastAsia\_DB\_1, SQL\_FranceCentral\_DB\_1, SQL\_GermanyWestCentral\_DB\_1, SQL\_CentralIndia\_DB\_1, SQL\_SouthIndia\_DB\_1, SQL\_JapanEast\_DB\_1, SQL\_JapanWest\_DB\_1, SQL\_NorthCentralUS\_DB\_1, SQL\_UKWest\_DB\_1, SQL\_WestUS\_DB\_1, SQL\_AustraliaSoutheast\_DB\_2, SQL\_BrazilSouth\_DB\_2, SQL\_CanadaCentral\_DB\_2, SQL\_CanadaEast\_DB\_2, SQL\_CentralUS\_DB\_2, SQL\_EastAsia\_DB\_2, SQL\_FranceCentral\_DB\_2, SQL\_GermanyWestCentral\_DB\_2, SQL\_CentralIndia\_DB\_2, SQL\_SouthIndia\_DB\_2, SQL\_JapanEast\_DB\_2, SQL\_JapanWest\_DB\_2, SQL\_NorthCentralUS\_DB\_2, SQL\_UKWest\_DB\_2, SQL\_WestUS\_DB\_2, SQL\_WestCentralUS\_DB\_1, SQL\_FranceSouth\_DB\_1, SQL\_WestCentralUS\_DB\_2, SQL\_FranceSouth\_DB\_2, SQL\_SwitzerlandNorth\_DB\_1, SQL\_SwitzerlandNorth\_DB\_2, SQL\_BrazilSoutheast\_DB\_1, SQL\_UAENorth\_DB\_1, SQL\_BrazilSoutheast\_DB\_2, SQL\_UAENorth\_DB\_2. Defaults to SQL\_Default. | `string` | `"SQL_Default"` | no |
| <a name="input_max_size_gb"></a> [max\_size\_gb](#input\_max\_size\_gb) | (Optional) The max size of the database in gigabytes. | `number` | `100` | no |
| <a name="input_network_rules_bypass"></a> [network\_rules\_bypass](#input\_network\_rules\_bypass) | List of bypass options for network rules. | `list(string)` | `null` | no |
| <a name="input_network_rules_default_action"></a> [network\_rules\_default\_action](#input\_network\_rules\_default\_action) | The default action for network rules. | `string` | `null` | no |
| <a name="input_network_rules_ip_rules"></a> [network\_rules\_ip\_rules](#input\_network\_rules\_ip\_rules) | List of IP addresses or ranges to allow for network rules. | `list(string)` | `null` | no |
| <a name="input_network_rules_virtual_network_subnet_ids"></a> [network\_rules\_virtual\_network\_subnet\_ids](#input\_network\_rules\_virtual\_network\_subnet\_ids) | List of virtual network subnet IDs to allow for network rules. | `list(string)` | `null` | no |
| <a name="input_primary_sql_server_location"></a> [primary\_sql\_server\_location](#input\_primary\_sql\_server\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `any` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Whether public network access is allowed for this server. Defaults to true. | `bool` | `true` | no |
| <a name="input_random_password_length"></a> [random\_password\_length](#input\_random\_password\_length) | The desired length of random password created by this module | `number` | `32` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `any` | n/a | yes |
| <a name="input_secondary_database_name"></a> [secondary\_database\_name](#input\_secondary\_database\_name) | (Optional) The name of the MS SQL Database. Changing this forces a new resource to be created. | `any` | `null` | no |
| <a name="input_secondary_resource_group_name"></a> [secondary\_resource\_group\_name](#input\_secondary\_resource\_group\_name) | A container that holds related resources for an Azure solution | `any` | n/a | yes |
| <a name="input_secondary_sql_server_location"></a> [secondary\_sql\_server\_location](#input\_secondary\_sql\_server\_location) | Specifies the supported Azure location to create secondary sql server resource | `any` | `null` | no |
| <a name="input_short_term_retention_policy_backup_interval_in_hours"></a> [short\_term\_retention\_policy\_backup\_interval\_in\_hours](#input\_short\_term\_retention\_policy\_backup\_interval\_in\_hours) | (Optional) The hours between each differential backup. This is only applicable to live databases but not dropped databases. Value has to be 12 or 24. Defaults to 12 hours. | `number` | `12` | no |
| <a name="input_short_term_retention_policy_retention_days"></a> [short\_term\_retention\_policy\_retention\_days](#input\_short\_term\_retention\_policy\_retention\_days) | (Required) Point In Time Restore configuration. Value has to be between 7 and 35 | `number` | `35` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Optional) Specifies the name of the SKU used by the database. For example, GP\_S\_Gen5\_2,HS\_Gen4\_1,BC\_Gen5\_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. Changing this from the HyperScale service tier to another service tier will force a new resource to be created. | `string` | n/a | yes |
| <a name="input_sql_failover_group_name"></a> [sql\_failover\_group\_name](#input\_sql\_failover\_group\_name) | (Required) The name of the Failover Group. Changing this forces a new resource to be created.' | `any` | `null` | no |
| <a name="input_sql_grace_minutes"></a> [sql\_grace\_minutes](#input\_sql\_grace\_minutes) | Applies only if mode is Automatic. The grace period in minutes before failover with data loss is attempted | `number` | `60` | no |
| <a name="input_sql_read_write_endpoint_failover_policys"></a> [sql\_read\_write\_endpoint\_failover\_policys](#input\_sql\_read\_write\_endpoint\_failover\_policys) | (Required) The failover policy of the read-write endpoint for the failover group. Possible values are Automatic or Manual | `string` | `"Automatic"` | no |
| <a name="input_sqlserver_name"></a> [sqlserver\_name](#input\_sqlserver\_name) | (Required) The name of the Microsoft SQL Server. This needs to be globally unique within Azure | `any` | `null` | no |
| <a name="input_storage_account_enable_https_traffic_only"></a> [storage\_account\_enable\_https\_traffic\_only](#input\_storage\_account\_enable\_https\_traffic\_only) | Specifies whether HTTPS traffic only is enabled for the storage account. | `bool` | `true` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The name of the storage account to store the all monitoring logs | `any` | `null` | no |
| <a name="input_storage_account_kind"></a> [storage\_account\_kind](#input\_storage\_account\_kind) | Specifies the kind of storage account. | `string` | `"StorageV2"` | no |
| <a name="input_storage_account_min_tls_version"></a> [storage\_account\_min\_tls\_version](#input\_storage\_account\_min\_tls\_version) | Specifies the minimum TLS version to use for the storage account. | `string` | `"TLS1_2"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the storage account name | `any` | `null` | no |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | Specifies the type of replication to use for the storage account. | `string` | `"GRS"` | no |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | Specifies the storage account tier. | `string` | `"Standard"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `any` | n/a | yes |
| <a name="input_tag_environment"></a> [tag\_environment](#input\_tag\_environment) | Environment in which the resources are deployed, such as production, testing, QA, etc. | `string` | `"default_environment"` | no |
| <a name="input_tag_owner"></a> [tag\_owner](#input\_tag\_owner) | The name or identification of the person or team creating or managing these resources. | `string` | `"default_owner"` | no |
| <a name="input_tag_project"></a> [tag\_project](#input\_tag\_project) | Name of the project to which these resources are associated. | `string` | `"default_project"` | no |
| <a name="input_threat_detection_audit_logs_retention_days"></a> [threat\_detection\_audit\_logs\_retention\_days](#input\_threat\_detection\_audit\_logs\_retention\_days) | Specifies the number of days to keep in the Threat Detection audit logs. | `number` | `0` | no |
| <a name="input_userassigned_identity_ids"></a> [userassigned\_identity\_ids](#input\_userassigned\_identity\_ids) | **OPTIONAL**: User assigned to be added on sql server in format: /subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.ManagedIdentity/userAssignedIdentities/userAssignedIdentityValue | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_primary_sql_server_fqdn"></a> [primary\_sql\_server\_fqdn](#output\_primary\_sql\_server\_fqdn) | The fully qualified domain name of the primary Azure SQL Server |
| <a name="output_primary_sql_server_id"></a> [primary\_sql\_server\_id](#output\_primary\_sql\_server\_id) | The primary Microsoft SQL Server ID |
| <a name="output_primary_sql_server_private_endpoint"></a> [primary\_sql\_server\_private\_endpoint](#output\_primary\_sql\_server\_private\_endpoint) | id of the Primary SQL server Private Endpoint |
| <a name="output_primary_sql_server_private_endpoint_fqdn"></a> [primary\_sql\_server\_private\_endpoint\_fqdn](#output\_primary\_sql\_server\_private\_endpoint\_fqdn) | Primary SQL server private endpoint FQDN |
| <a name="output_primary_sql_server_private_endpoint_ip"></a> [primary\_sql\_server\_private\_endpoint\_ip](#output\_primary\_sql\_server\_private\_endpoint\_ip) | Primary SQL server private endpoint IPv4 Addresses |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | The location of the resource group in which resources are created |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group in which resources are created |
| <a name="output_secondary_sql_server_fqdn"></a> [secondary\_sql\_server\_fqdn](#output\_secondary\_sql\_server\_fqdn) | The fully qualified domain name of the secondary Azure SQL Server |
| <a name="output_sql_database_id"></a> [sql\_database\_id](#output\_sql\_database\_id) | The SQL Database ID |
| <a name="output_sql_database_name"></a> [sql\_database\_name](#output\_sql\_database\_name) | The SQL Database Name |
| <a name="output_sql_failover_group_id"></a> [sql\_failover\_group\_id](#output\_sql\_failover\_group\_id) | A failover group of databases on a collection of Azure SQL servers. |
| <a name="output_sql_server_admin_password"></a> [sql\_server\_admin\_password](#output\_sql\_server\_admin\_password) | SQL database administrator login password |
| <a name="output_sql_server_admin_user"></a> [sql\_server\_admin\_user](#output\_sql\_server\_admin\_user) | SQL database administrator login id |
| <a name="output_sql_server_principal_id"></a> [sql\_server\_principal\_id](#output\_sql\_server\_principal\_id) | sql server principal id |
| <a name="output_sql_server_private_dns_zone_domain"></a> [sql\_server\_private\_dns\_zone\_domain](#output\_sql\_server\_private\_dns\_zone\_domain) | DNS zone name of SQL server Private endpoints dns name records |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | The ID of the storage account |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the storage account |

## License
This project is licensed under the MIT License - see the [MIT License](https://opensource.org/licenses/MIT) file for details.

## Contributing
Contributions are welcome! Please follow the guidance below for details on how to contribute to this project:
1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a pull request
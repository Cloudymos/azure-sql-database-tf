#----------------------------------
# Azure SQL Firewall/Network Rule 
#----------------------------------

# resource "azurerm_mssql_virtual_network_rule" "sql_server_vnet_rule" {
#   count     = var.subnet_ids != null ? 2 : 0
#   name      = "${azurerm_mssql_server.primary.name}-vnet-rule${count.index == 0 ? "" : "-pr"}-${count.index}"
#   server_id = azurerm_mssql_server.primary.id
#   subnet_id = var.subnet_ids[count.index]
# }

resource "azurerm_mssql_firewall_rule" "fw01" {
  count     = var.enable_firewall_rules && length(var.firewall_rules) > 0 ? length(var.firewall_rules) : 0
  name      = element(var.firewall_rules, count.index).name
  server_id = azurerm_mssql_server.primary.id

  start_ip_address = element(var.firewall_rules, count.index).start_ip_address
  end_ip_address   = element(var.firewall_rules, count.index).end_ip_address
}

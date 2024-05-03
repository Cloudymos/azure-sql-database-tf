
#------------------------------
# Private Link for SQL Server 
#------------------------------

resource "azurerm_private_dns_zone" "dnszone1" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
  tags                = merge(local.default_tags)
}

resource "azurerm_private_endpoint" "pep1" {
  name                = format("%s-primary", "sqldb-private-endpoint")
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.subnet_example.id
  tags                = merge(local.default_tags)

  private_service_connection {
    name                           = "sqldbprivatelink-primary"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.primary.id
    subresource_names              = ["sqlServer"]
  }

  private_dns_zone_group {
    name                 = "privatelink_database_windows_net"
    private_dns_zone_ids = [azurerm_private_dns_zone.dnszone1.id]
  }
}

# azure virtual network link between private zone and virtual network
resource "azurerm_private_dns_zone_virtual_network_link" "sqlserver_vnl" {
  name                  = "sqlserver-virtual-network-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dnszone1.name
  virtual_network_id    = azurerm_virtual_network.vnet_example.id
}

data "azurerm_private_dns_a_record" "sqlserver_a_record" {
  name                = var.sqlserver_name
  zone_name           = azurerm_private_dns_zone.dnszone1.name
  resource_group_name = var.resource_group_name
}
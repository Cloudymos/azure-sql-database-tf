resource "azurerm_virtual_network" "vnet_example" {
  name                = "example-network"
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]

  tags = merge(local.default_tags)
}

resource "azurerm_subnet" "subnet_example" {
  name                 = "example-subnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet_example2" {
  name                 = "example-subnet2"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_route_table" "example_route_table" {
  name                = "example-route-table"
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name

  route {
    name                   = "InternetRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "Internet"
  }
}

resource "azurerm_subnet_route_table_association" "example_association" {
  subnet_id      = azurerm_subnet.subnet_example.id
  route_table_id = azurerm_route_table.example_route_table.id
}
resource "azurerm_network_security_group" "example_nsg" {
  name                = "example-nsg"
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allow_rdp"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_windows_virtual_machine" "vm_example1" {
  name                  = "vm-example1"
  resource_group_name   = var.resource_group_name
  location              = var.primary_sql_server_location
  size                  = "Standard_DS2_v2"
  admin_username        = "useradm"
  admin_password        = "P@ssw0rd1234"
  network_interface_ids = [azurerm_network_interface.nic_example1.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  # custom_data = base64encode(templatefile("${path.module}/install_ssms.ps1", {}))
}

resource "azurerm_virtual_machine_extension" "ssms_install_extension_vm1" {
  name                 = "install-ssms"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm_example1.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/BOlimpio/install_ssms/main/install_ssms.ps1"],
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File install_ssms.ps1"
    }
  SETTINGS
}




resource "azurerm_windows_virtual_machine" "vm_example2" {
  name                  = "vm-example2"
  resource_group_name   = var.resource_group_name
  location              = var.primary_sql_server_location
  size                  = "Standard_DS2_v2"
  admin_username        = "useradm"
  admin_password        = "P@ssw0rd1234"
  network_interface_ids = [azurerm_network_interface.nic_example2.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  # custom_data = base64encode(templatefile("${path.module}/install_ssms.ps1", {}))
}

resource "azurerm_virtual_machine_extension" "ssms_install_extension_vm2" {
  name                 = "install-ssms"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm_example2.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/BOlimpio/install_ssms/main/install_ssms.ps1"],
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File install_ssms.ps1"
    }
  SETTINGS
}


resource "azurerm_public_ip" "example_public_ip1" {
  name                = "example-public-ip1"
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_public_ip" "example_public_ip2" {
  name                = "example-public-ip2"
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic_example1" {
  name                = "nic-example1"
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example_public_ip1.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_association_nic1" {
  network_interface_id      = azurerm_network_interface.nic_example1.id
  network_security_group_id = azurerm_network_security_group.example_nsg.id
}

resource "azurerm_network_interface" "nic_example2" {
  name                = "nic-example2"
  location            = var.primary_sql_server_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_example2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example_public_ip2.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_association_nic2" {
  network_interface_id      = azurerm_network_interface.nic_example2.id
  network_security_group_id = azurerm_network_security_group.example_nsg.id
}
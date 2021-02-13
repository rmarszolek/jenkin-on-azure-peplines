resource "azurerm_virtual_network" "resources" {
  name                = "${var.prefix}-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.resources.name
  address_space       = ["10.0.0.0/16"]
  tags = {
        environment = "${var.environmenttag}"
}
}
resource "azurerm_subnet" "resources_internal" {
  name                 = "${var.prefix}-internal"
  resource_group_name  = azurerm_resource_group.resources.name
  virtual_network_name = azurerm_virtual_network.resources.name
  address_prefix       = "10.0.0.0/24"
  
}

resource "azurerm_subnet" "resources_external" {
  name                 = "${var.prefix}-external"
  resource_group_name  = azurerm_resource_group.resources.name
  virtual_network_name = azurerm_virtual_network.resources.name
  address_prefix       = "10.0.2.0/24"
  
}

// security group 

resource "azurerm_network_security_group" "NSG_external" {
  name                = "${var.prefix}NSG_external"
  location            = var.location
  resource_group_name = azurerm_resource_group.resources.name
  tags = {
        environment = "${var.environmenttag}"}
}

resource "azurerm_network_security_rule" "NSG_external_SSH" {
  name                        = "SSH_from_local"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "${var.local_ip_address}"
  destination_address_prefix  = "*"
  resource_group_name = azurerm_resource_group.resources.name
  network_security_group_name = azurerm_network_security_group.NSG_external.name
}

resource "azurerm_network_security_rule" "NSG_external_Jenkins" {
  name                        = "Jenkins_from_local"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8080"
  source_address_prefix       = "${var.local_ip_address}"
  destination_address_prefix  = "*"
  resource_group_name = azurerm_resource_group.resources.name
  network_security_group_name = azurerm_network_security_group.NSG_external.name
}
resource "azurerm_subnet_network_security_group_association" "external_nsg" {
  subnet_id                 = azurerm_subnet.resources_external.id
  network_security_group_id = azurerm_network_security_group.NSG_external.id
}





// network interface creation
# Create public IPs
resource "azurerm_public_ip" "vm_ubuntu_public_ip" {
    name                         = "${var.prefix}_vm_ubuntu_public_ip"
    location            = azurerm_resource_group.resources.location
    resource_group_name = azurerm_resource_group.resources.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "${var.environmenttag}"
    }
} 
resource "azurerm_network_interface" "network_interface_ubuntu" {
  name                = "network_interface_ubuntu"
  location            = azurerm_resource_group.resources.location
  resource_group_name = azurerm_resource_group.resources.name

  ip_configuration {
    name                          = "external"
    subnet_id                     = azurerm_subnet.resources_external.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vm_ubuntu_public_ip.id
     
  }
  tags = {
        environment = "${var.environmenttag}"
    }
}

// machine creation 
resource "azurerm_linux_virtual_machine" "ubuntuVM" {
    name                  = "${var.prefix}-ubuntuVM"
    location              = azurerm_resource_group.resources.location
    resource_group_name   = azurerm_resource_group.resources.name
    network_interface_ids = [azurerm_network_interface.network_interface_ubuntu.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "myvm"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        //public_key     = tls_private_key.ubuntu_ssh.public_key_openssh  // genereted before (see upper)
        // or from file   generated file using ssh-keygen -m PEM -t rsa -b 4096
        public_key = file("test1.pub")
    }
    
     //custom_data from file 
    custom_data = base64encode(file("azure-vmubuntu.sh"))

    

    tags = {
        environment = "${var.environmenttag}"
    }
}



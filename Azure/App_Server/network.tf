# Create a virtual network
resource "azurerm_virtual_network" "vm_vnet" {
  name                = var.network_name
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  address_space       = [var.address_space]
}

# Create a subnet
resource "azurerm_subnet" "vm_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.vm_rg.name
  virtual_network_name = azurerm_virtual_network.vm_vnet.name
  address_prefixes     = [var.subnet_space]
}

# Create a public IP address
resource "azurerm_public_ip" "vm_public_ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  allocation_method   = var.public_ip_type
}

# Create a network security group
resource "azurerm_network_security_group" "vm_nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

    # Create a network security group rule to allow SSH access
    security_rule {
      name                        = var.remote_access_type
      priority                    = 1001
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = var.remote_access_port
      source_address_prefixes     = [var.allowed_IP]
      destination_address_prefix  = azurerm_public_ip.vm_public_ip.ip_address
    }

}


# Create a network interface
resource "azurerm_network_interface" "vm_nic" {
  name                      = var.nic_name
  location                  = azurerm_resource_group.vm_rg.location
  resource_group_name       = azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                          = "vm-ip-config"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vm_public_ip.id
  }
}


resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}

# Create a public IP address
resource "azurerm_public_ip" "db_public_ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  allocation_method   = var.public_ip_type
}

resource "azurerm_network_security_group" "default" {
  name                = var.nsg_name
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

    # Create a network security group rule to allow SSH access
    security_rule {
      name                        = "TGS-DB-rule"
      priority                    = 1001
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = "5432"
      source_address_prefixes     = [var.allowed_IP]
      destination_address_prefix  = azurerm_public_ip.db_public_ip.ip_address
    }

}

resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.db_subnet.id
  network_security_group_id = azurerm_network_security_group.default.id
}

resource "azurerm_private_dns_zone" "default" {
  name                = "TGS-PRD-DB02-pdz.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.vm_rg.name

  depends_on = [azurerm_subnet_network_security_group_association.default]
}

resource "azurerm_private_dns_zone_virtual_network_link" "default" {
  name                  = "TGS-PRD-DB02-pdzvnetlink.com"
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  virtual_network_id    = azurerm_virtual_network.db_vnet.id
  resource_group_name   = azurerm_resource_group.vm_rg.name
}

resource "random_password" "pass" {
  length = 20
}

resource "azurerm_postgresql_flexible_server" "default" {
  name                   = var.VM_Name
  resource_group_name    = azurerm_resource_group.vm_rg.name
  location               = azurerm_resource_group.vm_rg.location
  version                = "15"
  delegated_subnet_id    = azurerm_subnet.db_subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.default.id
  administrator_login    = var.admin_user
  administrator_password = random_password.pass.result
  zone                   = "1"
  storage_mb             = 32768
  sku_name               = "B_Standard_B1ms"
  backup_retention_days  = 7
}
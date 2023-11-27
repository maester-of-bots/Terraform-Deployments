resource "azurerm_postgresql_flexible_server_database" "default" {
  name      = var.VM_Name
  server_id = azurerm_postgresql_flexible_server.default.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}
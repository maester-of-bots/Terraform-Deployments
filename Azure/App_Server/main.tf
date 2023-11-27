# Create a virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.VM_Name
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
  size                = var.VM_Size
  admin_username      = var.admin_user
  admin_password      = var.admin_password
  disable_password_authentication   =   false

  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  os_disk {
    name              = "vm-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb      = var.disk_size
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
}

}
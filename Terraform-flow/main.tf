# Resource Group
resource "azurerm_resource_group" "terra" {
    name = var.resource_group
    location = var.location
  
}

# Virtual Network

resource "azurerm_virtual_network" "terra" {
    name = var.virtual_network
    location = var.location
    resource_group_name = azurerm_linux_virtual_machine.terra.name
    address_space = ["10.0.0.0/20"]
  
}

resource "azurerm_subnet" "terra" {
    name = var.subnet
    virtual_network_name = azurerm_virtual_network.terra.name
    resource_group_name = azurerm_resource_group.terra.name
    address_prefixes = ["10.0.1.0/24"]
  
}

resource "azurerm_network_interface" "terra" {
    name = var.network_interface
    resource_group_name = azurerm_resource_group.terra.name
    location = var.location

    ip_configuration {
      name = "internal"
      subnet_id = var.subnet
      private_ip_address_allocation = "Dynamic"

    }
  
}

resource "azurerm_linux_virtual_machine" "terra" {
    name = var.vm_name
    resource_group_name = azurerm_resource_group.terra.name
    location = var.location
    size = "Standard_B1s"
    admin_username = var.admin_username
    admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.terra.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
  

output "resource_group_name" {
  value = azurerm_resource_group.terra.name
}

output "vnet_name" {
  value = azurerm_virtual_network.terra.name
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.terra.name
}

output "vm_private_ip" {
  value = azurerm_network_interface.terra.private_ip_address
}
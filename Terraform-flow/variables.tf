variable "resource_group" {
    description = "The resource group for resources"
    type = string
    default = "rg-terraform-mylab"
  
}

variable "location" {
    description = "The location for resource group"
    type = string
    default = "East US"
  
}

variable "virtual_network" {
    description = "The Vnet for resources"
    type = string
    default = "terraform-vnet"
  
}

variable "subnet" {
    description = "subnet for virtual network"
    type = string
    default = "terra-subnet"
  
}

variable "vm_name" {
    description = "The virtual machine "
    type = string
    default = "vm-terraform"
  
}

variable "network_interface" {
    description = "Network interface card for VM"
    type = string
    default = "nic-terra"
  
}

variable "admin_username" {
    description = "Username for Vm login"
    type = string
    default = "azureuser"
  
}

variable "admin_password" {
    description = "password for vm login"
    type = string
    sensitive = true
  
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
resource "azurerm_resource_group" "TERRAFORM" {
  name     = "TERRAFORM"
  location = "West Europe"
}
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.TERRAFORM.location
  resource_group_name = azurerm_resource_group.TERRAFORM.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.TERRAFORM.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_network_interface" "terraformNI" {
  name                = "terraformNI"
  location            = azurerm_resource_group.TERRAFORM.location
  resource_group_name = azurerm_resource_group.TERRAFORM.name
  ip_configuration {
    name                          = "myNicConfiguration"
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.example.id
  }
}


resource "azurerm_windows_virtual_machine" "terraformVM" {
  name                  = "terraformVM"
  resource_group_name   = azurerm_resource_group.TERRAFORM.name
  location              = azurerm_resource_group.TERRAFORM.location
  size                  = "Standard_B2s"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.terraformNI.id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

}

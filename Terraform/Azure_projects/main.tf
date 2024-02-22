terraform {
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.91.0"
        }
    }
}

resource "azurerm_resource_group" "TERRAFORM" {
    name = "TERRAFORM"
    location = "East US"
}

resource "azurerm_network_interface" "terraformNI" {
name = "terraformNI"
location = azurerm_resource_group.TERRAFORM.location
resource_group_name = azurerm_resource_group.TERRAFORM.name
}

resource "azurerm_windows_virtual_machine" "terraformVM" {
    name = "terraformVM"
    resource_group_name =  azurerm_resource_group.TERRAFORM.name
    location = azurerm_resource_group.TERRAFORM.location
    size = "Standard_B2s"
    admin_username = miracle
    admin_password = oluDaddy@gmail.11
    network_interface_ids = [ azurerm_network_interface.terraformNI.id, ]
    
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

}
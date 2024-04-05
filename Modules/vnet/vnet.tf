#resource group
resource "azurerm_resource_group" "rg-main" {
  name     = var.azurerm_resource_group_name
  location = var.location
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  address_space       = var.address_space     #["10.0.0.0/16"]
  dns_servers         =  var.dns_servers      #["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.subnet
    address_prefix = var.address_prefix                         #"10.0.1.0/24"
  }
depends_on = [azurerm_resource_group.rg-main]
}
#resource group
resource "azurerm_resource_group" "rg-main" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

resource "azurerm_subnet" "subnetname" {
  name                 = var.subnet
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.vnet
  address_prefixes     = var.address_prefixes                               #["10.0.2.0/24"]
  service_endpoints    = var.service_endpoints                              #["Microsoft.Sql", "Microsoft.Storage"]
  depends_on = [azurerm_resource_group.rg-main]

}



resource "azurerm_storage_account" "Storage_account" {
  name                = var.storage_account_name
  resource_group_name = var.azurerm_resource_group_name

  location                 = var.location
  account_tier             = var.account_tier               #"Standard"
  account_replication_type = var.account_replication_type   #"LRS"

  network_rules {
    default_action             = var.default_action                          #"Deny"
    ip_rules                   = var.ip_rules                                            #["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.subnetname.id]
  }
  depends_on = [azurerm_resource_group.rg-main]
}
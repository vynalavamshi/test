data "azurerm_client_config" "current" {}

#resource-group
resource "azurerm_resource_group" "resourcegroupname" {
  name = var.azurerm_resource_group_name
  location = var.location
}

#vnet
module "azurerm_virtual_network" {
  source                      = "../Modules/vnet"
  vnet                        = var.vnet
  location                    = var.location
  azurerm_resource_group_name = var.azurerm_resource_group_name
  address_space               = var.address_space #["10.0.0.0/16"]
  dns_servers                 = var.dns_servers   #["10.0.0.4", "10.0.0.5"]
  subnet                      = var.subnet
  address_prefix              = var.address_prefix #"10.0.1.0/24"
}


#virtual network
module "azurerm_virtual_machine" {
  source = "../Modules/virtual machine"
  #nic
  location                      = var.location
  azurerm_resource_group_name   = var.azurerm_resource_group_name
  network_interface_name        = var.network_interface_name
  ip_configuration_name         = var.ip_configuration_name #"testconfiguration1"
  private_ip_address_allocation = var.private_ip_address_allocation
  subnet_id                      =                     var.subnet_id
  virtual_machine_name          = var.virtual_machine_name
  vm_size                       = var.vm_size
  vnet = var.vnet
  vm_publisher = var.vm_publisher #"Canonical"
  vm_offer     = var.vm_offer     #"0001-com-ubuntu-server-jammy"
  vm_sku       = var.vm_sku       #"22_04-lts"
  vm_version   = var.vm_version

  storage_os_disk_name = var.storage_os_disk_name #"myosdisk1"
  caching              = var.caching              # "ReadWrite"
  create_option        = var.create_option        #"FromImage"
  managed_disk_type    = var.managed_disk_type

  computer       = var.computer       #"hostname"
  admin_username = var.admin_username #"testadmin"
  admin_password = var.admin_password
}


#storage_account
module "azurerm_storage_account" {
  source = "../Modules/storage acccount"

  storage_account_name        = var.storage_account_name
  azurerm_resource_group_name = var.azurerm_resource_group_name
  location                 = var.location
  account_tier             = var.account_tier #"Standard"
  account_replication_type = var.account_replication_type

  default_action = var.default_action #"Deny"
  ip_rules       = var.ip_rules
  subnet         = var.subnet
  #   resource_group_name  = var.azurerm_resource_group_name
  vnet              = var.vnet
  address_prefixes  = var.address_prefixes #["10.0.2.0/24"]
  service_endpoints = var.service_endpoints
}



#key_vault

module "azurerm_key_vault" {
  source                      = "../Modules/key vault"
  key_vault_name              = var.key_vault_name
  location                    = var.location
  azurerm_resource_group_name = var.azurerm_resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption #true
  soft_delete_retention_days  = var.soft_delete_retention_days  # 7
  purge_protection_enabled    = var.purge_protection_enabled    #false
 object_id_string = var.object_id_string
  sku_name = var.sku_name #"standard"
   
#   access_policy_tenant_id                         = data.azurerm_client_config.current.tenant_id
#   access_policy_object_id                         = data.azurerm_client_config.current.object_id
  access_policy_key_permissions     = var.access_policy_key_permissions
  access_policy_secret_permissions  = var.access_policy_secret_permissions
  access_policy_storage_permissions = var.access_policy_storage_permissions
}

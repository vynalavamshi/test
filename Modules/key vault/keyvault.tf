
data "azurerm_client_config" "current" {}


#resource group
resource "azurerm_resource_group" "rg-main" {
  name     = var.azurerm_resource_group_name
  location = var.location
}


resource "azurerm_key_vault" "example" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.azurerm_resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption                #true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days # 7
  purge_protection_enabled    = var.purge_protection_enabled   #false

  sku_name = var.sku_name   #"standard"
  depends_on = [azurerm_resource_group.rg-main]

  access_policy {
    # object_id = data.azurerm_client_config.current.
    object_id = var.object_id_string

    tenant_id = data.azurerm_client_config.current.tenant_id
    # object_id = data.azurerm_client_config.current.object_id
    key_permissions     = var.access_policy_key_permissions
    secret_permissions  = var.access_policy_secret_permissions
    storage_permissions = var.access_policy_storage_permissions
  }
}
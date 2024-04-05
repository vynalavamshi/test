#resource group name
variable "azurerm_resource_group_name" {
  description = "Required name of the resource group"
  type =  string
}

#rg- location
variable "location" {
    description = "Required location of the resource group"
    type = string
}



variable "key_vault_name" {
    type = string
}
variable "enabled_for_disk_encryption" {
    type = bool
}

variable "soft_delete_retention_days" {
    type = number
}


variable "purge_protection_enabled" {
    type = bool
  
}
# variable "access_policy_tenant_id" {
#   type    = string
# }

variable "object_id_string" {
    type = string
  
}

# variable "access_policy_object_id" {
#   type    = string
# }

variable "access_policy_key_permissions" {
  type    = list(string)
  #default = ["Get"]
}

variable "access_policy_secret_permissions" {
  type    = list(string)
  #default = ["Get"]
}

variable "access_policy_storage_permissions" {
  type    = list(string)
  #default = ["Get"]
}

variable "sku_name" {
  type = string
}
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

variable "subnet_id" {
    type = string
}


variable "object_id_string" {
  type = string  
}
#vnet
variable "vnet" {
    description = "Required vnet name here"
    type = string  
}

variable "address_space" {
    description = "Required address_space of vnet"
    type = list(string)
}

variable "dns_servers" {
    description = "Required dns_servers"
    type = list(string)
}




variable "address_prefix" {
    description = "Req address_prefix"
    type = string 
}






#interface
variable "network_interface_name" {
    description = "Req - name of interface"
    type = string
}

variable "ip_configuration_name" {
    description = "Req - ip_configuration_name "
    type = string
}

variable "private_ip_address_allocation" {
    description = "Req - private_ip_address_allocation"
    type = string
}




#vm
variable "virtual_machine_name" {
    description = "Req - vm name"
    type = string
}

variable "vm_size" {
  description = "Req - vm_size"
  type = string
}

variable "vm_publisher" {
    description = "Req - vm_publisher"
    type = string
}

variable "vm_offer" {
  type = string
}
variable "vm_sku" {
  type = string
}

variable "vm_version" {
  type =  string
}

variable "storage_os_disk_name" {
    type = string
}

variable "caching" {
    type = string
}

variable "create_option" {
    type = string
}

variable "managed_disk_type" {
    type = string
}

variable "computer" {
    type = string
}

variable "admin_username" {
    type = string
    description = "Req"
}     

variable "admin_password" {
  type = string
  description = "Req"
}




#storage_account



#subnet
variable "subnet" {
    description = "required subnet name"
    type = string
}

variable "address_prefixes" {
    description = "Req address_prefixes"
    type = list(string) 
}

variable "service_endpoints" {
    description = "Required service_endpoints"
    type = set(string)
}

#storage account
variable "storage_account_name" {
    description = "Required storage account name"
    type = string
}

variable "account_tier" {
    description = "Required account tier"
    type = string
}

variable "account_replication_type" {
    description = "req - account_replication_type"
    type = string
}

variable "default_action" {
    description = "req - default action"
    type = string
}

variable "ip_rules" {
  description = "req - ip_rules"
  type = set(string)
}


#key_vault


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
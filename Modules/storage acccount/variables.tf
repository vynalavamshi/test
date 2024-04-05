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

#vnet
variable "vnet" {
    description = "Required vnet name here"
    type = string  
}

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
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

variable "address_space" {
    description = "Required address_space of vnet"
    type = list(string)
}

variable "dns_servers" {
    description = "Required dns_servers"
    type = list(string)
}

#subnet
variable "subnet" {
    description = "required subnet name"
    type = string
}


variable "address_prefix" {
    description = "Req address_prefix"
    type = string 
}
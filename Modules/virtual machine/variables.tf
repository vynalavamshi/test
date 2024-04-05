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

variable "vnet" {
    type = string
}

#subnet

variable "subnet_id" {
    description = "required subnet name"
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
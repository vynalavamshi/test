#resource group
resource "azurerm_resource_group" "rg-main" {
  name     = var.azurerm_resource_group_name
  location = var.location
}



#interface
resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name                  #"testconfiguration1"
    subnet_id                     = var.subnet_id
   private_ip_address_allocation = var.private_ip_address_allocation           #"Dynamic"
  
  }
  depends_on = [azurerm_resource_group.rg-main]
}


#virtual machine
resource "azurerm_virtual_machine" "virtualmachine" {
  name                  = var.virtual_machine_name
  location              = var.location
  resource_group_name   = var.azurerm_resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size                                 #"Standard_DS1_v2"
  storage_image_reference {
    publisher = var.vm_publisher                   #"Canonical"
    offer     = var.vm_offer                       #"0001-com-ubuntu-server-jammy"
    sku       = var.vm_sku                         #"22_04-lts"
    version   = var.vm_version                              #"latest"
  }
  storage_os_disk {
    name              = var.storage_os_disk_name    #"myosdisk1"
    caching           = var.caching                # "ReadWrite"
    create_option     = var.create_option           #"FromImage"
    managed_disk_type = var.managed_disk_type       #"Standard_LRS"
  }
  os_profile {
    computer_name  = var.computer                    #"hostname"
    admin_username = var.admin_username              #"testadmin"
    admin_password = var.admin_password              #"Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  depends_on = [azurerm_resource_group.rg-main,azurerm_network_interface.nic]
}
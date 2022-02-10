# Configure the Azure provider
provider "azurerm" { 
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}

resource "azurerm_resource_group" "resourcegroup" {
        name = "RG-SYNITIPRD"
        location = "ukwest"
        tags = {
            Project = "Syniti"
            Environment = "Production"
            "Business Owner" = "Nigel Griffiths" 

        }
}



#refer to a subnet
data "azurerm_subnet" "subnet" {
  name                 = "SharedServices"
  virtual_network_name = "VNET-COREPRODUKW"
  resource_group_name  = "RG-CORENETWORKPROD"
}


# create a network interface
resource "azurerm_network_interface" "azwsynapprd01-nic01" {
  name                =  "azwsynapprd01-nic01"
  location            = "${resource.azurerm_resource_group.resourcegroup.location}"
  resource_group_name = "${resource.azurerm_resource_group.resourcegroup.name}"

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
    
  }
  enable_accelerated_networking = "true"
}



# create a network interface
resource "azurerm_network_interface" "azwsyndbprd01-nic01" {
  name                =  "azwsyndbprd01-nic01"
  location            = "${resource.azurerm_resource_group.resourcegroup.location}"
  resource_group_name = "${resource.azurerm_resource_group.resourcegroup.name}"

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
    
  }
  enable_accelerated_networking = "true"
}


# Create virtual machine
resource "azurerm_virtual_machine" "vm" {
    name                  = "azwsynapprd01"
    location              = "${azurerm_network_interface.azwsynapprd01-nic01.location}"
    resource_group_name   = "${resource.azurerm_resource_group.resourcegroup.name}"
    vm_size               = "Standard_D16ds_v4"
  
    
   
    network_interface_ids = ["${azurerm_network_interface.azwsynapprd01-nic01.id}"]

license_type = "Windows_Server"



storage_os_disk {
    name              = "azwsynapprd01-diskos"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb = "128"
  }

  storage_data_disk {
  
managed_disk_type = "Premium_LRS"
name = "azwsynapprd01-disk01"
create_option = "empty"
disk_size_gb = "200"
lun = "0"

  }


os_profile {
  computer_name = "azwsynapprd01"
  admin_username = "localadmin"
  admin_password = "Welcome123123!!"
}

os_profile_windows_config {
  provision_vm_agent = "true"
  
}



  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }


}


# Create virtual machine
resource "azurerm_virtual_machine" "vm2" {
    name                  = "azwsyndbprd01"
    location              = "${azurerm_network_interface.azwsyndbprd01-nic01.location}"
    resource_group_name   = "${resource.azurerm_resource_group.resourcegroup.name}"
    vm_size               = "Standard_E16s_v3"
  
    
   
    network_interface_ids = ["${azurerm_network_interface.azwsyndbprd01-nic01.id}"]

license_type = "Windows_Server"



storage_os_disk {
    name              = "azwsyndbprd01-diskos"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb = "128"
  }

  storage_data_disk {
  
managed_disk_type = "Standard_LRS"
name = "azwsyndbprd01-disk01"
create_option = "empty"
disk_size_gb = "250"
lun = "0"

  }


os_profile {
  computer_name = "azwsyndbprd01"
  admin_username = "localadmin"
  admin_password = "Welcome123123!"
}

os_profile_windows_config {
  provision_vm_agent = "true"
  
}



  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }


}








# Uncomment this line to delete the OS disk automatically when deleting the VM
#delete_os_disk_on_termination = true

# Uncomment this line to delete the data disks automatically when deleting the VM
#delete_data_disks_on_termination = true



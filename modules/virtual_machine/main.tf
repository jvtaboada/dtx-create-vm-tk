resource "azurerm_public_ip" "pip" {
  for_each            = toset(var.vm_names)
  name                = "pip-${each.key}"
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {    
  for_each            = toset(var.vm_names)
  name                = "nic-${each.key}"
  location            = var.rg_location
  resource_group_name = var.rg_name

ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-associate" {
  for_each            = toset(var.vm_names)
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = var.nsg_id
}

resource "azurerm_windows_virtual_machine" "vm" {
  for_each            = toset(var.vm_names)
  name                = "${each.key}"
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = "Standard_B2s"

  admin_username      = "adminuser" ## sensitive data ou variavel
  admin_password      = "P@$$w0rd1234!" ## sensitive data ou variavel
  
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}

# Script de criação de 2 usuários no Windows
resource "azurerm_virtual_machine_extension" "add_users" {
  for_each            = toset(var.vm_names)
  name                 = "add-users"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm[each.key].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

    ## sensitive data nos usuários e senha
  settings = <<SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -Command \"net user dataex1 Teste123* /add; net user dataex2 Teste123* /add; net localgroup Administrators dataex1 /add; net localgroup Administrators dataex2 /add\""
  }
  SETTINGS
}

# Configurando auto-shutdown nas VMs (22h | UTC-3)
resource "azurerm_dev_test_global_vm_shutdown_schedule" "autoshutdown" {
  for_each            = toset(var.vm_names)
  virtual_machine_id = azurerm_windows_virtual_machine.vm[each.key].id
  location           = var.rg_location
  enabled            = true

  daily_recurrence_time = "2200"
  timezone              = "E. South America Standard Time"

  notification_settings {
    enabled = false
    }
}
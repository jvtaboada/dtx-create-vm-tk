module "create_virtual_machine" {
  source = "./modules/virtual_machine"

  vm_names = var.vm_names
  rg_location = data.azurerm_resource_group.rg.location
  rg_name = var.rg_name

  subnet_id = data.azurerm_subnet.subnet.id
  nsg_id = data.azurerm_network_security_group.nsg.id
}
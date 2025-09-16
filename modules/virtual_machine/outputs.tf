output "vms_info" {
  value = [
    for name in var.vm_names : {
      vm_name   = name
      public_ip = azurerm_public_ip.pip[name].ip_address
    }
  ]
}
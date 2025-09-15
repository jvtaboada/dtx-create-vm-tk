provider "azurerm" {
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id

  features {
    
    ## verificar se há necessidade de alguma configuração
    /*   virtual_machine {
      detach_implicit_data_disk_on_deletion = false
      delete_os_disk_on_deletion            = true
      graceful_shutdown                     = false
      skip_shutdown_and_force_delete        = false
    }*/
  }
}
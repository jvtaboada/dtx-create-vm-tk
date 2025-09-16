output "vms_summary" {
  description = "Resumo das VMs criadas - Nome e IP público"
  value       = module.create_virtual_machine.vms_info
}
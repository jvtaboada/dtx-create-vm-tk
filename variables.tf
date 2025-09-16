variable "tenant_id" {
  description = "ID do Tenant do Azure"
  type        = string
}

variable "subscription_id" {
  description = "ID da Subscription do Azure"
  type        = string
}

variable "rg_name" {
  description = "Nome do RG pré-existente"
  type        = string
}

variable "vnet_name" {
  description = "Nome da Virtual Network pré-existente"
  type        = string
}

variable "subnet_name" {
  description = "Nome da Subnet da Virtual Network pré-existente"
  type        = string
}

variable "nsg_name" {
  description = "Nome da Network Security Group pré-existente"
  type        = string
}

variable "vm_names" {
  description = "Lista com o nome das VMs - define a quantidade de VMs a serem criadas"
  type        = list(string)
}

variable "admin_user" { 
  description = "Nome do usuário administrador das VMs a serem criadas"
  type        = string
  sensitive = true
}

variable "admin_password" { 
  description = "Senha do usuário administrador das VMs a serem criadas"
  type        = string
  sensitive = true
}
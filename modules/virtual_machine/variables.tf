variable "vm_names" {
  description = "Lista com o nome das VMs - define a quantidade de VMs a serem criadas"
  type        = list(string)
}

variable "rg_name" {
  description = "Nome do RG pré-existente"
  type        = string
}

variable "rg_location" {
  description = "Região do RG pré-existente"
  type        = string
}

variable "subnet_id" {
  description = "ID da subnet pré-existente"
  type        = string
}

variable "nsg_id" {
  description = "ID da NSG pré-existente"
  type        = string
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
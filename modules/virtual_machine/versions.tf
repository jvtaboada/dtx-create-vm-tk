terraform {
  required_version = ">= 1.12.2, < 2.0.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}
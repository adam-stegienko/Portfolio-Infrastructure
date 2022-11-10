terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate2adam"
    container_name       = "tfstate"
    key                  = "env:/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.service_principal["subscription_id"]
  tenant_id       = var.service_principal["tenant_id"]
  client_id       = var.service_principal["client_id"]
  client_secret   = var.service_principal["client_secret"]
}
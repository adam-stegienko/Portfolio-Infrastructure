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
    key                  = "prod-terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
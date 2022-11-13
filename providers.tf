terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.14.0"
    }
    helm = {
      version = "2.4.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "portfolio-develeap"
    storage_account_name = "tfstate2adam"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.service_principal["subscription_id"]
  client_id     = var.service_principal["client_id"]
  client_secret = var.service_principal["client_secret"]
  tenant_id       = var.service_principal["tenant_id"]
}

provider "azuread" {
  features {}
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}

data "azurerm_subscription" "current" {}
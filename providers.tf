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
      source  = "hashicorp/helm"
      version = "~>2.7.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.15.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "portfolio-develeap"
    storage_account_name = "tfstate2adam"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

data "azurerm_subscription" "current" {}

provider "azurerm" {
  features {}

  subscription_id = var.service_principal["subscription_id"]
  client_id       = var.service_principal["client_id"]
  client_secret   = var.service_principal["client_secret"]
  tenant_id       = var.service_principal["tenant_id"]
}

provider "azuread" {
  # features {}
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "helm_release" {
  source = "git::git@github.com:adam-stegienko/Portfolio-Configuration.git"
}
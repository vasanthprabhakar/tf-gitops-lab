terraform {
  required_version = ">= 1.10.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {} # settings come from terraform init -backend-config
}

provider "azurerm" {
  features {}
  # The pipeline identity is Contributor on one resource group only, so it must not
  # try to register resource providers at subscription scope (they are pre-registered).
  resource_provider_registrations = "none"
}

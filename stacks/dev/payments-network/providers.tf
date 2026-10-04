terraform {
  required_version = ">= 1.10.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {} # values supplied at init: -backend-config=backend.hcl
}

provider "azurerm" {
  features {} # required block in azurerm, even when empty
  # subscription comes from ARM_SUBSCRIPTION_ID set by the pipeline
}

variable "hub_vnet_id" {
  description = "Resource ID of the hub VNet (set per environment in terraform.tfvars)."
  type        = string
}

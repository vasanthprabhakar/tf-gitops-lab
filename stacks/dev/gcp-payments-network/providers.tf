terraform {
  required_version = ">= 1.10.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
  backend "gcs" {} # bucket and prefix supplied at init
}

variable "project_id" {
  description = "Project for this environment (set in terraform.tfvars)."
  type        = string
}

variable "hub_network" {
  description = "Self link of the hub VPC (set per environment in terraform.tfvars)."
  type        = string
}

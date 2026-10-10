terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {} # bucket, key, region, use_lockfile supplied at init
}

provider "aws" {
  region = "ap-south-1" # same form value as the module's region input
}

variable "azs" {
  description = "Availability Zones for this environment (terraform.tfvars)."
  type        = list(string)
}

variable "hub_vpc_id" {
  description = "Hub VPC ID for this environment (terraform.tfvars)."
  type        = string
}

variable "hub_cidr" {
  description = "Hub VPC range for this environment (terraform.tfvars)."
  type        = string
}

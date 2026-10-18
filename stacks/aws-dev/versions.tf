terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {} # bucket, key, region and use_lockfile come from terraform init -backend-config
}
provider "aws" {
  region = var.region
  default_tags {
    tags = {
      managed_by = "terraform"
    }
  }
}

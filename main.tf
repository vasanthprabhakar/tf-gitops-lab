terraform {
  required_version = ">= 1.7.0"
}

variable "environment" {
  type    = string
  default = "dev"
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be dev, test or prod."
  }
}

variable "subnets" {
  type    = map(number)
  default = { app = 2, data = 2, pe = 2, web = 2 }
}

locals {
  cidrs = { for i, k in sort(keys(var.subnets)) : k => cidrsubnet("10.20.0.0/22", var.subnets[k], i) }
}

# terraform_data is built into Terraform: no provider, no cloud, no cost.
resource "terraform_data" "subnet" {
  for_each = local.cidrs
  input    = { name = "snet-${each.key}-${var.environment}", cidr = each.value }
}

output "cidrs" {
  value = local.cidrs
}

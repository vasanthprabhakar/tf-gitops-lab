module "network" {
  source        = "git::https://github.com/example-org/tf-modules.git//azure-spoke-network?ref=v1.4.0"
  name          = "payments"
  environment   = "dev"
  location      = "westeurope"
  address_space = "10.20.0.0/22"
  hub_vnet_id   = var.hub_vnet_id
  tags = {
    owner       = "group:default/guests"
    cost_center = "cc-100"
  }
}

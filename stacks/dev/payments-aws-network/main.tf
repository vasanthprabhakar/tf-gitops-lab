module "network" {
  source      = "git::https://github.com/example-org/tf-modules.git//aws-spoke-vpc?ref=v1.0.0"
  name        = "payments-aws"
  environment = "dev"
  region      = "ap-south-1"
  azs         = var.azs
  cidr        = "10.20.0.0/22"
  hub_vpc_id  = var.hub_vpc_id
  hub_cidr    = var.hub_cidr
  tags = {
    owner       = "guests"
    cost_center = "cc-100"
  }
}

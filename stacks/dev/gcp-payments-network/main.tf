module "network" {
  source      = "git::https://github.com/example-org/tf-modules.git//gcp-spoke-network?ref=v1.0.0"
  project_id  = var.project_id
  name        = "gcp-payments"
  environment = "dev"
  region      = "asia-south1"
  cidr        = "10.20.0.0/22"
  hub_network = var.hub_network
  labels = {
    owner       = "guests"
    cost_center = "cc-100"
  }
}

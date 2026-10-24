variable "project_id" {
  description = "Lab project ID (passed as TF_VAR_project_id)."
  type        = string
}

variable "region" {
  description = "Region for the lab subnet."
  type        = string
  default     = "us-central1"
}

resource "google_compute_network" "spoke" {
  name                    = "vpc-gitops-dev"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "app" {
  name                     = "snet-gitops-dev-app"
  region                   = var.region
  network                  = google_compute_network.spoke.id
  ip_cidr_range            = "10.40.0.0/24"
  private_ip_google_access = true
  description              = "app subnet - owner platform, cost_center cc-100"
}

output "network_self_link" {
  value = google_compute_network.spoke.self_link
}

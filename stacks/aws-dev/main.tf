variable "region" {
  description = "Region for the lab VPC."
  type        = string
  default     = "ap-south-1"
}
resource "aws_vpc" "spoke" {
  cidr_block           = "10.40.0.0/22"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "vpc-gitops-dev"
    owner       = "platform"
    cost_center = "cc-100"
  }
}
resource "aws_subnet" "app" {
  vpc_id            = aws_vpc.spoke.id
  cidr_block        = "10.40.0.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "snet-gitops-dev-app"
  }
}
output "vpc_id" {
  value = aws_vpc.spoke.id
}

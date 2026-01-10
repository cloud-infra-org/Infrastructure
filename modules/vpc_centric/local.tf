locals {
  vpc_name = "${var.environment}-vpc_centric"

  common_tags = {
    Environment = var.environment
    Owner       = "devops"
    ManagedBy   = "Terraform"
  }
}

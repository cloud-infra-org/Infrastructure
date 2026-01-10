module "vpc" {
  source = "../vpc"

  vpc_cidr    = var.vpc_cidr
  vpc_name    = local.vpc_name
  environment = var.environment
}

module "subnets" {
  source = "../subnets"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment

  availability_zones        = var.availability_zones
  public_subnet_cidrs       = var.public_subnet_cidrs
  private_app_subnet_cidrs  = var.private_app_subnet_cidrs
  private_data_subnet_cidrs = var.private_data_subnet_cidrs
}

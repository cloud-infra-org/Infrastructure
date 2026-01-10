module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = "10.0.0.0/16"
  vpc_name    = "dev-vpc"
  environment = "dev"
}

module "subnets" {
  source = "../../modules/subnets"

  vpc_id     = module.vpc.vpc_id
  environment = "dev"

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]

  # Public Subnets (Ingress Layer)
  public_subnet_cidrs = [
    "10.0.0.0/21",
    "10.0.8.0/21"
  ]

  # Private Application Subnets
  private_app_subnet_cidrs = [
    "10.0.16.0/21",
    "10.0.24.0/21"
  ]

  # Private Data Subnets (Future-ready)
  private_data_subnet_cidrs = [
    "10.0.32.0/22",
    "10.0.36.0/22"
  ]
}

module "igw" {
  source = "../../modules/igw"

  vpc_id      = module.vpc.vpc_id
  environment = "dev"
  name        = "dev"
}


module "nat" {
  source = "../../modules/nat"

  public_subnet_id = module.subnets.public_subnet_ids[0] # public-az1
  environment      = "dev"
}

module "routing" {
  source = "../../modules/routing"

  vpc_id                 = module.vpc.vpc_id
  igw_id                 = module.igw.igw_id
  nat_gateway_id         = module.nat.nat_gateway_id
  public_subnet_ids      = module.subnets.public_subnet_ids
  private_app_subnet_ids = module.subnets.private_app_subnet_ids

  environment = "dev"
}

module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id = module.vpc.vpc_id

  allowed_ingress_cidr = ["10.0.0.0/16"] # internal only
  tags = {
    Environment = "dev"
    Owner       = "devops"
  }
}

module "ec2" {
  source = "../../modules/ec2"

  subnet_id         = module.subnets.private_app_subnet_ids[0]
  security_group_id = module.security_groups.private_ec2_sg_id

  tags = {
    Environment = "dev"
    Owner       = "devops"
  }
}



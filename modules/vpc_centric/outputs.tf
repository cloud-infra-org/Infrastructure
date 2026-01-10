output "vpc_id" {
  description = "VPC ID for vpc_centric"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}

output "private_app_subnet_ids" {
  value = module.subnets.private_app_subnet_ids
}

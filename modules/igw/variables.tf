variable "vpc_id" {
  description = "VPC ID where the Internet Gateway will be attached"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, prod, etc)"
  type        = string
}

variable "name" {
  description = "Name prefix for the Internet Gateway"
  type        = string
}

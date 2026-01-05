variable "vpc_id" {
  description = "VPC ID where the security group is created"
  type        = string
}

variable "allowed_ingress_cidr" {
  description = "CIDR allowed to access the EC2 instance"
  type        = list(string)
}

variable "ssh_port" {
  description = "SSH port"
  type        = number
  default     = 22
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

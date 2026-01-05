variable "subnet_id" {
  description = "Private subnet ID for EC2"
  type        = string
}

variable "security_group_id" {
  description = "Security group for EC2"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

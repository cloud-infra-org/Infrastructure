output "security_group_id" {
  description = "Security group ID for private EC2"
  value       = aws_security_group.private_ec2.id
}

output "private_ec2_sg_id" {
  description = "Security group ID for private EC2 validation instance"
  value       = aws_security_group.private_ec2.id
}

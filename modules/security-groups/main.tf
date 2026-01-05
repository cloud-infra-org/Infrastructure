resource "aws_security_group" "private_ec2" {
  name        = "private-ec2-sg"
  description = "Security group for private EC2 validation instance"
  vpc_id      = var.vpc_id

  # Inbound: SSH only, from allowed CIDR
  ingress {
    description = "SSH access"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr
  }

  # Outbound: allow all (required for NAT)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

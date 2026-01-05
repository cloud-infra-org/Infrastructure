resource "aws_instance" "validation" {
  ami                         = "ami-0c02fb55956c7d316"
  instance_type               = "t3.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids       = [var.security_group_id]
  iam_instance_profile         = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = false

  user_data = <<EOF
#!/bin/bash
yum update -y
EOF

  tags = merge(
    var.tags,
    {
      Name = "private-validation-ec2"
    }
  )
}

resource "aws_iam_role" "ec2_role" {
  name = "private-ec2-validation-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "private-ec2-validation-profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_iam_role_policy_attachment" "ec2_readonly" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

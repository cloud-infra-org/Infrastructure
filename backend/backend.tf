terraform {
  backend "s3" {
    bucket         = "srikanth-tf-backend-state-2026"
    key            = "infrastructure/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}

resource "aws_security_group" "example_sg" {
  name = "richard-sg-2026-terraform"
  description = "Security group managed by Terraform"
}

# resource "aws_s3_bucket" "richard-sg-2026-terraform-backend" {
#   bucket = var.s3-bucket-name

#     tags = {
#         Name = var.s3-bucket-name
#         Environment = "Dev"
#     }
# }
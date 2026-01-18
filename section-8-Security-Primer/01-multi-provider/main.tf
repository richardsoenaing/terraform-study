provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "prod"
  region = "ap-southeast-1"
}

resource "aws_security_group" "dev_sg" {
  name        = "richard-terraform-2026-dev-sg"
  description = "Security group for dev environment managed by Terraform"
}

resource "aws_security_group" "prod_sg" {
  provider    = aws.prod
  name        = "richard-terraform-2026-prod-sg"
  description = "Security group for prod environment managed by Terraform"
}

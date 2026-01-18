terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 6.0"
      configuration_aliases = [aws.dev]
    }
  }
}

resource "aws_security_group" "dev_sg" {
  name        = var.security_group_name
  description = "Security group for dev environment managed by Terraform"
  provider    = aws.dev
}

resource "aws_security_group" "prod" {
  name        = var.security_group_name
  description = "Security group for prod environment managed by Terraform"
}

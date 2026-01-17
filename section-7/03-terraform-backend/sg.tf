provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "example_sg" {
  name        = "test-sg"
  description = "Example security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

terraform {
  backend "local" {
    path = "prod.tfstate"
  }
}

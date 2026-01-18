provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "prod" {
  name = "richard-terraform-2026-dev-user"
}

resource "aws_security_group" "dev_sg" {
  name        = "richard-terraform-2026-dev-sg"
  description = "Security group for dev environment managed by Terraform"
}

variable "list-of-ingress-ports" {
  description = "List of ingress ports for the security group"
  type        = map(number)
  default     = { http = 80, http-alt = 8080, https = 443, ssh = 22 }
}

resource "aws_vpc_security_group_ingress_rule" "dev_sg_rule" {
  for_each = var.list-of-ingress-ports

  ip_protocol       = "tcp"
  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = each.value
  to_port           = each.value
}

#   security_group_id = aws_security_group.dev_sg.id
#   from_port         = 80
#   to_port           = 80
#   ip_protocol       = "tcp"
#   cidr_ipv4         = "0.0.0.0/0"

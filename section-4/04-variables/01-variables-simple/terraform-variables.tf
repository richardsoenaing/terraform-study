provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_tls" {
  name        = "Allow_TLS"
  description = "Example variable security group"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip_address
  from_port         = var.tls_port
  to_port           = var.tls_port
  ip_protocol       = var.ip_protocol
}

resource "aws_vpc_security_group_ingress_rule" "allow_app_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip_address
  from_port         = var.app_port
  to_port           = var.app_port
  ip_protocol       = var.ip_protocol
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip_address
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  ip_protocol       = var.ip_protocol
}

resource "aws_vpc_security_group_ingress_rule" "allow_ftp_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip_address
  from_port         = var.ftp_port
  to_port           = var.ftp_port
  ip_protocol       = var.ip_protocol
}

output "security_group" {
  description = "Security Group Id"
  value       = aws_security_group.allow_tls.id
}
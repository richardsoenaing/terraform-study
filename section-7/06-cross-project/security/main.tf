provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_rule" {
  security_group_id = aws_security_group.allow_tls.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "${data.terraform_remote_state.security.outputs.load_balancer_eip}/32"
}

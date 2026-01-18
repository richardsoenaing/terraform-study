provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall-cross-ref"
  description = "Security group to allow TLS access from EIP"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${aws_eip.lb.public_ip}/32"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_instance" "web" {
  ami           = "ami-068c0051b15cdb816" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "WebServerWithEIPAndSG"
  }
}

output "public_ip" {
  description = "Public IP"
  value = aws_eip.lb.public_ip
}

output "security_group" {
  description = "Secruity Group Id"
  value = aws_security_group.allow_tls.id
}

output "ec2" {
  description = "EC 2 Id"
  value = aws_instance.web.id
}
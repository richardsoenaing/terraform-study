provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "requetest_db_firewall2" {
  name        = "db_firewall"
  description = "Allow database traffic"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

moved {
  from = aws_security_group.requetest_db_firewall
  to = aws_security_group.requetest_db_firewall2
}
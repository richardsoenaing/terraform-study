provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
    domain="vpc"
}

resource "aws_instance" "web" {
  ami           = "ami-068c0051b15cdb816" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "WebServerWithEIP"
  }
}

output "aws_eip_lb" {
  description = "Get Elastic IP"
  value = aws_eip.lb.public_ip
}

output "aws_instance_web_id" {
  description = "Get Web Server Instance ID"
  value = aws_instance.web.arn
}
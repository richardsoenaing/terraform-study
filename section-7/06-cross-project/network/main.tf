provider "aws" {
  region  = "us-east-1"
}

resource "aws_eip" "lb_eip" {
  domain = "vpc"
}

output "load_balancer_eip" {
  description = "The Elastic IP address for the load balancer"
  value       = aws_eip.lb_eip.public_ip
}
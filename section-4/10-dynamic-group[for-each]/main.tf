provider "aws" {
  region = "us-east-1"
}

variable "sg_ports"{
    type    = list(number)
    default = [22,  80, 443, 8080]
}

resource "aws_security_group" "dynamic_sg" {
  name        = "dynamic-security-group"
  description = "Dynamically created security group"

  dynamic "ingress" {
    for_each =  var.sg_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Dynamic ingress rule for port ${ingress.value}"
    }
  }
}

output "security_group_id" {
  value = aws_security_group.dynamic_sg.id
}
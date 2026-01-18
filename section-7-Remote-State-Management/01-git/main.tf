provider "aws"{
    region = var.regionkey
}

resource "aws_security_group" "richard_sg" {
    name        = var.security_group_name
    description = "Security group created by Terraform"

    dynamic "ingress" {
      for_each = var.ingress_ports
      content{
        from_port = ingress.value
        to_port   = ingress.value
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Default ingress port ${ingress.value}"
      }
    }
}
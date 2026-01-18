terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amzon_linux_2.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_tag_name
  }
}
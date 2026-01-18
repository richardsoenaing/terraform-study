provider "aws" {
  region = "us-east-1"
}

locals {
  instance_type = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.medium"
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = local.instance_type[terraform.workspace]

  tags = {
    Name = "${terraform.workspace} workspace app server"
  }
}

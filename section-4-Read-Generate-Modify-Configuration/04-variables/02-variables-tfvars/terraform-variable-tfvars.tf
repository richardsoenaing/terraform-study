provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "WebServer"
  }
}
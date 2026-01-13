provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? "t2.micro" : "t3.medium"

  tags = {
    Name = "WebServer"
  }
}
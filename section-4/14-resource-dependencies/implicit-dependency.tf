provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["137112412989"] # Amazon's official AWS account ID
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "WebServerInstance"
  }
  
  vpc_security_group_ids = [aws_security_group.dev-sec-group.id]

  depends_on = [aws_security_group.dev-sec-group]

}

resource "aws_security_group" "dev-sec-group" {
  name        = "dev-security-group"
  description = "Security group for development environment"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

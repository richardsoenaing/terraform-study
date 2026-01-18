provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-07ff62358b87c7116" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }

  provisioner "local-exec" {
    command = "echo 'Instance ${self.id} has been created with IP ${self.public_ip}' >> instance_info.txt"
  }
}
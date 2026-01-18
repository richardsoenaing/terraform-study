provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                    = "ami-07ff62358b87c7116" # Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  key_name               = "demo-terraform-keypair" # Ensure this key pair exists in your AWS account
  vpc_security_group_ids = [aws_security_group.example.id]

  tags = {
    Name = "ExampleInstance"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("demo-terraform-keypair.pem") # Adjust the path to your private key
      host        = self.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Security group for example instance"

  dynamic "ingress" {
    for_each = toset(var.ip-list)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "ip-list" {
  type    = list(string)
  default = ["22", "80"]
}


output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

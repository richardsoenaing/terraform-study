provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}

variable "instance_type" {
  type = string
}

data "aws_ec2_instance_type" "example" {
  instance_type = var.instance_type
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = data.aws_ec2_instance_type.example.instance_type

  lifecycle {
    precondition {
      condition     = data.aws_ec2_instance_type.example.free_tier_eligible == true
      error_message = "Only launch free tier eligible instance types."
    }
    postcondition {
      condition = self.public_ip != null
      error_message = "Instance must have a public IP address."
    }
  }
}


output "free_tier_eligible" {
  value = data.aws_ec2_instance_type.example.free_tier_eligible
}

output "aws_instance_output" {
  value = aws_instance.web_server.id
}

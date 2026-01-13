provider "aws" {
  region = "ap-southeast-1" # Singapore region
}

data "aws_ami" "ubuntu" {
  most_recent = true # Ensures the latest version is selected

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd*/ubuntu-noble-24.04-amd64-server-*"] # Matches the standard Ubuntu 24.04 image name pattern
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] # Explicitly filter for the x86 64-bit architecture
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # Canonical (the creators of Ubuntu) AWS account ID
  owners = ["099720109477"]
}

variable "instance_name" {
    description = "The name tag for the EC2 instance"
    type        = string
    default     = "MyDataSourceInstance"
}

resource "aws_instance" "my_datasource_instance" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"

    tags = {
        Name = var.instance_name
    }
}

output "instance_id" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.my_datasource_instance.id
}
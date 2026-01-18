provider "aws" {
  region = "ap-southeast-1"
}

variable "aws_ec2s" {
  type        = map(string)
  description = "Map of environment names to EC2 instance types"
  default = {
    dev     = "t2.micro",
    staging = "t2.small",
    prod    = "t2.medium"
  }
}

module "ec2" {
  source = "../../modules/ec2"

  for_each          = var.aws_ec2s
  instance_type     = each.value
  instance_tag_name = "TeamA-EC2-Instance-${each.key}"
}

resource "aws_eip" "this" {
    domain = "vpc"
    
    for_each = var.aws_ec2s
    instance = module.ec2[ each.key ].aws_instance_id // <-- Reference the EC2 instance from the module. This work because we implemented output in the module.

    tags = {
        Name = "TeamA-EIP-${each.key}"
    }
}
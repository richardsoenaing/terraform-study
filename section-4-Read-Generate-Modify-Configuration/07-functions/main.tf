# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_iam_user" "this" {
#   name = "ec2-user"
# }

# resource "aws_iam_user_policy" "ec2_access_policy" {
#   name = "ec2-user-policy"
#   user = aws_iam_user.this.name

#   policy = file("./ec2-access-policy.json")
# }

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

provider "aws" {
  region =  var.region
}

locals {
    common_tags = {
        Team = "payment-team"
    }
}

# variable "ec2_tags" {
#     description = "Name of the EC2"
#     type = list(string)
#     default = ["dev-server", "production-server"]
# }

# variable "ami_map" {
#   description = "Mapping of AWS regions to AMI IDs"
#   type        = map(string)
#   default = {
#     "us-east-1" = "ami-07ff62358b87c7116"
#     "us-west-2" = "ami-0b2f6494ff0b07a0e"
#     "eu-west-1" = "ami-047bb4163c506cd98"
#   }
# }

# resource "aws_instance" "web" {
#   ami           = lookup(var.ami_map, var.region)
#   instance_type = "t2.micro"

#   count = length(var.ec2_tags)

#   tags = {
#     Name = var.ec2_tags[count.index]
#     created_date = formatdate("YYYY-MM-DD", timestamp())
#   }
# }


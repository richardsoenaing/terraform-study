provider "aws" {
  region     = "us-east-1"
}

# resource "aws_instance" "myec2" {
#   ami           = "ami-068c0051b15cdb816"
#   instance_type = "t2.micro"
# }

# resource "aws_iam_user" "demouser" {
#   name = "richard-demo-user"
# }
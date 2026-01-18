module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.2.0"

  subnet_id = "subnet-0397042abd381ecc2"
  instance_type = "t2.micro"
}


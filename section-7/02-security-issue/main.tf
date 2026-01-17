provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "richard-terraform-db" {
  allocated_storage    = 10
  engine               = "mysql"
  db_name              = "richard_terraform_db"
  engine_version       = 8.0
  instance_class       = "db.t3.micro"
  username             = "adminuser"
  password             = file("pass.txt")
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

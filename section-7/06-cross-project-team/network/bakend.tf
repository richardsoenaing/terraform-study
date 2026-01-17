terraform {
  backend "s3" {
    bucket = "richard-terraform-s3-bucket"
    key = "dev.tfstate"
    region = "us-east-1"
  }
}
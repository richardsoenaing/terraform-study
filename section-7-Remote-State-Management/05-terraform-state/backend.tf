terraform {
  backend "s3" {
    bucket = "richard-terraform-2026-state"
    key = "dev.tfstate"
    region = "us-east-1"
  }
}
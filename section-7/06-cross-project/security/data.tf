data "terraform_remote_state" "security" {
  backend = "s3"
  config = {
    bucket = "richard-terraform-s3-bucket"
    key    = "dev.tfstate"
    region = "us-east-1"
  }
} 
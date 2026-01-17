terraform {
  backend "s3" {
    bucket = "richard-sg-2026-terraform-backend"
    key    = "production.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}

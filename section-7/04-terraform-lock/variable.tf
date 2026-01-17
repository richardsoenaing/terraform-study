variable aws-region {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable s3-bucket-name {
  description = "The name of the S3 bucket for Terraform backend"
  type        = string
  default     = "richard-sg-2026-terraform-backend"
}
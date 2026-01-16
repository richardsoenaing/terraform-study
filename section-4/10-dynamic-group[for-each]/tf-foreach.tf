provider "aws" {
  region = "us-east-1"
}

variable "iam_users" {
  type    = list(string)
  default = ["alice", "bob", "charlie"]
}

resource "aws_iam_user" "dynamic_users" {
  for_each = toset(var.iam_users)
  name     = each.value
}

variable "db_password" {
  type        = string
  description = "Password for the database"

  validation {
    condition     = length(var.db_password) >= 12
    error_message = "Database password length must be at least 12 characters long."
  }

}

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
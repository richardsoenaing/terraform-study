provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "example" {
  count = 3
  name  = "example-user-${count.index}"
}

output "user_names" {
  value = aws_iam_user.example[*].name
}

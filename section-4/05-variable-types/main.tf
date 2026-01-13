provider "aws" {
  region = "us-east-1"
}

variable "dev_names" {
  type    = list(string)
  default = ["dev-user1", "dev-user2", "dev-user3"]
}

resource "aws_iam_user" "lb" {
  name = var.dev_names[count.index]
  count = length(var.dev_names)
}

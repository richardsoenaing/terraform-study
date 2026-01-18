provider "aws" {
  region = "ap-southeast-1"
}

ephemeral "random_password" "secure_string" {
  length           = 16
  special          = true
  override_special = "!@#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "db_password" {
  name        = "ephemeral_secure_string_secret"
  description = "A secret to store ephemeral secure string"
}

resource "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id                = aws_secretsmanager_secret.db_password.id
  secret_string_wo         = ephemeral.random_password.secure_string.result
  secret_string_wo_version = 1
}

output "aws_secrect_manager_value" {
  value = aws_secretsmanager_secret.db_password
  sensitive = true
}

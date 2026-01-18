provider "aws" {
  region = "ap-southeast-1"
}

variable "ssm_param_name" {
  default = "richard-test-ps"
}

resource "aws_ssm_parameter" "richard_ps" {
  name  = var.ssm_param_name
  type  = "SecureString"
  value = "ThisIsASecureParameterValue2026!"
}

# data "aws_ssm_parameter" "richard_ps" {
#   name = var.ssm_param_name
#   with_decryption = true
# }

output "richard_ps_value" {
  value     = aws_ssm_parameter.richard_ps.value
  sensitive = true
}

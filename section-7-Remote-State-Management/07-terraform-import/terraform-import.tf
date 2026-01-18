provider "aws" {
  region = "us-east-1"
}

import {
  to = aws_security_group.dev_sg // <--- New Resource name to import into
  id = "sg-0c123456789abcdef"    // <--- Actual Security Group ID from AWS
}


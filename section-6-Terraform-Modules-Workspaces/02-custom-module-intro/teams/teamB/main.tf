provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "ap-southeast-1"
  region = "ap-southeast-1"
}

module "sg" {
  source              = "../../modules/sg"
  security_group_name = "TeamB-Dev-SG"

  providers = {
    aws.dev = aws.ap-southeast-1
  }
}
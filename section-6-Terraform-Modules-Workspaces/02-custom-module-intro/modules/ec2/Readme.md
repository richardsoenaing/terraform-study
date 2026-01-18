# EC2 Module

This Terraform module provisions an AWS EC2 instance with the latest Amazon Linux 2 AMI.

## Features

- Automatically selects the latest Amazon Linux 2 AMI
- Configurable instance type
- Customizable instance name tag
- Compatible with `for_each` and `count` meta-arguments

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | ~> 6.0 |

## Resources Created

- `aws_instance.web_server` - EC2 instance

## Data Sources Used

- `aws_ami.amzon_linux_2` - Fetches the latest Amazon Linux 2 AMI

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instance_type | Type of EC2 instance | `string` | `"t2.micro"` | no |
| instance_tag_name | Tag Name for the EC2 instance | `string` | `"WebServerInstance"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws_instance_id | The ID of the EC2 instance |

## Usage Example

### Basic Usage

```hcl
module "ec2" {
  source = "../../modules/ec2"
  
  instance_type     = "t2.micro"
  instance_tag_name = "MyWebServer"
}
```

### Using with for_each

```hcl
variable "aws_ec2s" {
  type = map(string)
  default = {
    dev     = "t2.micro"
    staging = "t2.small"
    prod    = "t2.medium"
  }
}

module "ec2" {
  source = "../../modules/ec2"
  
  for_each = var.aws_ec2s
  
  instance_type     = each.value
  instance_tag_name = "EC2-${each.key}"
}
```

## Notes

- The module uses a data source to fetch the latest Amazon Linux 2 AMI automatically
- The provider configuration must be set at the root module level when using this module with `for_each` or `count`
- The AMI filter targets Amazon Linux 2 HVM (Hardware Virtual Machine) images with GP2 storage

variable "environment" {
    default = "prod"
}

variable "ami_id" {
    description = "The AMI ID to use for the instance."
    type = string
    default = "ami-068c0051b15cdb816"
}

# variable "instance_type" {
#     description = "The type of instance to use."
#     type = string
# }
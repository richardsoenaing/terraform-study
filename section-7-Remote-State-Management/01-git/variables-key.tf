variable "regionkey" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "ingress_ports"{
    description = "List of ingress ports for the security group"
    type        = list(number)
}
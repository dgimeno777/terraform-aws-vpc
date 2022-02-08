locals {
  resource_name_suffix = terraform.workspace
  default_tags = {
    Project : "terraform-aws-vpc"
    Deployment : terraform.workspace
    Application : "vpc"
  }
}

variable "aws_region" {
  type        = string
  description = "The AWS region to use"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "The AWS profile to use"
  default     = "terraform_aws_vpc"
}

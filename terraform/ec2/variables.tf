locals {
  vpc_id               = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_public_a_id   = data.terraform_remote_state.vpc.outputs.subnet_public_a_id
  subnet_private_a_id  = data.terraform_remote_state.vpc.outputs.subnet_private_a_id
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

variable "vpc_workspace" {
  type        = string
  description = "Workspace of the VPC terraform repo"
  default     = "default"
}

variable "key_name" {
  type        = string
  description = "Key pair key_name"
}

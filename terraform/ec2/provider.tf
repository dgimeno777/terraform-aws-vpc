terraform {
  backend "s3" {
    # Variables not allowed so hardcode
    bucket  = "dgimeno-repos"
    key     = "terraform-aws-vpc/ec2/terraform.tfstate"
    region  = "us-east-1"
    profile = "terraform_aws_vpc"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

data "terraform_remote_state" "vpc" {
  backend   = "s3"
  workspace = var.vpc_workspace
  config = {
    # Variables not allowed so hardcode
    bucket  = "dgimeno-repos"
    key     = "terraform-aws-vpc/vpc/terraform.tfstate"
    region  = var.aws_region
    profile = var.aws_profile
  }
}

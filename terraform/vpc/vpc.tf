resource "aws_vpc" "terraform" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name : "terraform-${local.resource_name_suffix}"
  }
}

resource "aws_internet_gateway" "terraform" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name : "terraform-${local.resource_name_suffix}"
  }
}

resource "aws_route_table" "terraform_public" {
  vpc_id = aws_vpc.terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform.id
  }
  tags = {
    Name : "terraform-public-${local.resource_name_suffix}"
  }
}

resource "aws_route_table" "terraform_private" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name : "terraform-private-${local.resource_name_suffix}"
  }
}

module "subnet_a" {
  source               = "./az_subnet_set"
  vpc_id               = aws_vpc.terraform.id
  availability_zone    = data.aws_availability_zone.us_east_1a.name
  resource_name_prefix = "terraform"
  public_subnet_info = {
    cidr_block     = "10.0.0.0/24",
    route_table_id = aws_route_table.terraform_public.id
  }
  private_subnet_info = {
    cidr_block     = "10.0.1.0/24"
    route_table_id = aws_route_table.terraform_private.id
  }
}

module "subnet_b" {
  source               = "./az_subnet_set"
  vpc_id               = aws_vpc.terraform.id
  availability_zone    = data.aws_availability_zone.us_east_1b.name
  resource_name_prefix = "terraform"
  public_subnet_info = {
    cidr_block     = "10.0.2.0/24",
    route_table_id = aws_route_table.terraform_public.id
  }
  private_subnet_info = {
    cidr_block     = "10.0.3.0/24"
    route_table_id = aws_route_table.terraform_private.id
  }
}

module "subnet_c" {
  source               = "./az_subnet_set"
  vpc_id               = aws_vpc.terraform.id
  availability_zone    = data.aws_availability_zone.us_east_1c.name
  resource_name_prefix = "terraform"
  public_subnet_info = {
    cidr_block     = "10.0.4.0/24",
    route_table_id = aws_route_table.terraform_public.id
  }
  private_subnet_info = {
    cidr_block     = "10.0.5.0/24"
    route_table_id = aws_route_table.terraform_private.id
  }
}

module "subnet_d" {
  source               = "./az_subnet_set"
  vpc_id               = aws_vpc.terraform.id
  availability_zone    = data.aws_availability_zone.us_east_1d.name
  resource_name_prefix = "terraform"
  public_subnet_info = {
    cidr_block     = "10.0.6.0/24",
    route_table_id = aws_route_table.terraform_public.id
  }
  private_subnet_info = {
    cidr_block     = "10.0.7.0/24"
    route_table_id = aws_route_table.terraform_private.id
  }
}

module "subnet_e" {
  source               = "./az_subnet_set"
  vpc_id               = aws_vpc.terraform.id
  availability_zone    = data.aws_availability_zone.us_east_1e.name
  resource_name_prefix = "terraform"
  public_subnet_info = {
    cidr_block     = "10.0.8.0/24",
    route_table_id = aws_route_table.terraform_public.id
  }
  private_subnet_info = {
    cidr_block     = "10.0.9.0/24"
    route_table_id = aws_route_table.terraform_private.id
  }
}

module "subnet_f" {
  source               = "./az_subnet_set"
  vpc_id               = aws_vpc.terraform.id
  availability_zone    = data.aws_availability_zone.us_east_1f.name
  resource_name_prefix = "terraform"
  public_subnet_info = {
    cidr_block     = "10.0.10.0/24",
    route_table_id = aws_route_table.terraform_public.id
  }
  private_subnet_info = {
    cidr_block     = "10.0.11.0/24"
    route_table_id = aws_route_table.terraform_private.id
  }
}

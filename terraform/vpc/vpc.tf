data "aws_availability_zone" "us_east_1a" {
  name = "us-east-1a"
}

data "aws_availability_zone" "us_east_1b" {
  name = "us-east-1b"
}

data "aws_availability_zone" "us_east_1c" {
  name = "us-east-1c"
}

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

resource "aws_subnet" "terraform_public_a" {
  vpc_id                  = aws_vpc.terraform.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = data.aws_availability_zone.us_east_1a.name
  map_public_ip_on_launch = true
  tags = {
    Name : "terraform-public-1a-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_public_a" {
  route_table_id = aws_route_table.terraform_public.id
  subnet_id      = aws_subnet.terraform_public_a.id
}

resource "aws_subnet" "terraform_private_a" {
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zone.us_east_1a.name
  tags = {
    Name : "terraform-private-1a-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_private_a" {
  route_table_id = aws_route_table.terraform_private.id
  subnet_id      = aws_subnet.terraform_private_a.id
}

resource "aws_subnet" "terraform_public_b" {
  vpc_id                  = aws_vpc.terraform.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = data.aws_availability_zone.us_east_1b.name
  map_public_ip_on_launch = true
  tags = {
    Name : "terraform-public-1b-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_public_b" {
  route_table_id = aws_route_table.terraform_public.id
  subnet_id      = aws_subnet.terraform_public_b.id
}

resource "aws_subnet" "terraform_private_b" {
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = data.aws_availability_zone.us_east_1b.name
  tags = {
    Name : "terraform-private-1b-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_private_b" {
  route_table_id = aws_route_table.terraform_private.id
  subnet_id      = aws_subnet.terraform_private_b.id
}

resource "aws_subnet" "terraform_public_c" {
  vpc_id                  = aws_vpc.terraform.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = data.aws_availability_zone.us_east_1c.name
  map_public_ip_on_launch = true
  tags = {
    Name : "terraform-public-1c-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_public_c" {
  route_table_id = aws_route_table.terraform_public.id
  subnet_id      = aws_subnet.terraform_public_c.id
}

resource "aws_subnet" "terraform_private_c" {
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = data.aws_availability_zone.us_east_1c.name
  tags = {
    Name : "terraform-private-1c-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_private_c" {
  route_table_id = aws_route_table.terraform_private.id
  subnet_id      = aws_subnet.terraform_private_c.id
}

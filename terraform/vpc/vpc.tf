resource "aws_vpc" "terraform_aws_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name : "dgimeno-vpc-${local.resource_name_suffix}"
  }
}

resource "aws_internet_gateway" "terraform_aws_vpc" {
  vpc_id = aws_vpc.terraform_aws_vpc.id
  tags = {
    Name : "dgimeno-igw-${local.resource_name_suffix}"
  }
}

resource "aws_route_table" "terraform_aws_vpc" {
  vpc_id = aws_vpc.terraform_aws_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_aws_vpc.id
  }
  tags = {
    Name : "dgimeno-route-table-${local.resource_name_suffix}"
  }
}

resource "aws_subnet" "terraform_aws_vpc_public_a" {
  vpc_id                  = aws_vpc.terraform_aws_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name : "dgimeno-subnet-1a-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_aws_vpc_public_a" {
  route_table_id = aws_route_table.terraform_aws_vpc.id
  subnet_id      = aws_subnet.terraform_aws_vpc_public_a.id
}

resource "aws_subnet" "terraform_aws_vpc_public_b" {
  vpc_id                  = aws_vpc.terraform_aws_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name : "dgimeno-subnet-1b-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_aws_vpc_public_b" {
  route_table_id = aws_route_table.terraform_aws_vpc.id
  subnet_id      = aws_subnet.terraform_aws_vpc_public_b.id
}

resource "aws_subnet" "terraform_aws_vpc_public_c" {
  vpc_id                  = aws_vpc.terraform_aws_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name : "dgimeno-subnet-1c-${local.resource_name_suffix}"
  }
}

resource "aws_route_table_association" "terraform_aws_vpc_public_c" {
  route_table_id = aws_route_table.terraform_aws_vpc.id
  subnet_id      = aws_subnet.terraform_aws_vpc_public_c.id
}

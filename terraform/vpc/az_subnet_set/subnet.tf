resource "aws_subnet" "public" {
  count                   = var.public_subnet_info != null ? 1 : 0
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  cidr_block              = var.public_subnet_info.cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name : "${var.resource_name_prefix}-public-${local.availability_zone_ender_string}-${terraform.workspace}"
  }
}

resource "aws_route_table_association" "public" {
  route_table_id = var.public_subnet_info.route_table_id
  subnet_id      = aws_subnet.public[0].id
}

resource "aws_subnet" "private" {
  count             = var.private_subnet_info != null ? 1 : 0
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block        = var.private_subnet_info.cidr_block
  tags = {
    Name : "${var.resource_name_prefix}-private-${local.availability_zone_ender_string}-${terraform.workspace}"
  }
}

resource "aws_route_table_association" "private" {
  route_table_id = var.private_subnet_info.route_table_id
  subnet_id      = aws_subnet.private[0].id
}

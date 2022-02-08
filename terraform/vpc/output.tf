output "vpc_id" {
  value = aws_vpc.terraform.id
}

output "subnet_public_a_id" {
  value = aws_subnet.terraform_public_a.id
}

output "subnet_private_a_id" {
  value = aws_subnet.terraform_private_a.id
}

output "subnet_public_b_id" {
  value = aws_subnet.terraform_public_b.id
}

output "subnet_private_b_id" {
  value = aws_subnet.terraform_private_b.id
}

output "subnet_public_c_id" {
  value = aws_subnet.terraform_public_c.id
}

output "subnet_private_c_id" {
  value = aws_subnet.terraform_private_c.id
}

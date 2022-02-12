output "vpc_id" {
  value = aws_vpc.terraform.id
}

output "subnet_public_a_id" {
  value = module.subnet_a.public_subnet_id
}

output "subnet_private_a_id" {
  value = module.subnet_a.private_subnet_id
}

output "subnet_public_b_id" {
  value = module.subnet_b.public_subnet_id
}

output "subnet_private_b_id" {
  value = module.subnet_b.private_subnet_id
}

output "subnet_public_c_id" {
  value = module.subnet_c.public_subnet_id
}

output "subnet_private_c_id" {
  value = module.subnet_c.private_subnet_id
}

output "subnet_public_d_id" {
  value = module.subnet_d.public_subnet_id
}

output "subnet_private_d_id" {
  value = module.subnet_d.private_subnet_id
}

output "subnet_public_e_id" {
  value = module.subnet_e.public_subnet_id
}

output "subnet_private_e_id" {
  value = module.subnet_e.private_subnet_id
}

output "subnet_public_f_id" {
  value = module.subnet_f.public_subnet_id
}

output "subnet_private_f_id" {
  value = module.subnet_f.private_subnet_id
}

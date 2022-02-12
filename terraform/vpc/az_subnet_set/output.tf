output "public_subnet_id" {
  value = length(aws_subnet.public) > 0 ? aws_subnet.public[0].id : null
}

output "private_subnet_id" {
  value = length(aws_subnet.private) > 0 ? aws_subnet.private[0].id : null
}

output "jumpbox_public_ip" {
  value = aws_instance.terraform_jumpbox.public_ip
}

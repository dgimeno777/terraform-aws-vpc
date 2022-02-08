data "aws_ec2_instance_type" "terraform_t2micro" {
  instance_type = "t2.micro"
}

resource "aws_security_group" "terraform_jumpbox" {
  vpc_id = local.vpc_id
  ingress {
    # Allow SSH from my public IP
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = [
      "${local.public_ip}/32"
    ]
  }
  egress {
    # Allow all egress
    protocol  = "-1"
    from_port = 0
    to_port   = 0
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "aws_instance" "terraform_jumpbox" {
  ami                         = data.aws_ami.terraform.id
  subnet_id                   = local.subnet_public_a_id
  instance_type               = data.aws_ec2_instance_type.terraform_t2micro.instance_type
  key_name                    = data.aws_key_pair.dgimeno_macbook_air.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.terraform_jumpbox.id
  ]
  tags = {
    Name : "terraform-jumpbox-${local.resource_name_suffix}"
  }
}

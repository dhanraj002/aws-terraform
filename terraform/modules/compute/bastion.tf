resource "aws_instance" "bastion" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  user_data              = var.user_data
  root_block_device{
    encrypted = true
  }

  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-bastion"
    EnvType          = var.aws-account-env 
    Provisioner      = "terraform"
  }
}
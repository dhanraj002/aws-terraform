module "bastion" {
  source          = "../modules/compute"
  ami             = var.bastion_ami
  instance_type   = var.bastion_instance_type
  security_groups = [aws_security_group.ssh.id]
  subnet_id       = module.vpc.subnets[0]
  key_name        = var.bastion_key_name
  user_data       = file("src/cloud-init-scripts/db-control_init.sh")
  name            = var.name
  aws-account-env = var.aws_account_env
}
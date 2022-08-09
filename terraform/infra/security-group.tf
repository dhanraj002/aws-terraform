resource "aws_security_group" "ssh" {
  name        = "tf-${var.name}-ssh-${var.aws_account_env}-sg"
  description = "Grants access to ssh"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = var.cidr_whitelist
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg_egress_cidr_block
  }

  lifecycle {
    ignore_changes = [ingress]
  }

  tags = {
    Name             = "tf-${var.name}-ssh-${var.aws_account_env}-sg"
    EnvType          = var.aws-account-env
    Provisioner      = "terraform"
  }
}

resource "aws_security_group" "document-db" {
  name        = "tf-${var.name}-docdb-${var.aws_account_env}-sg"
  description = "Allows access to the document database"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 27017
    to_port   = 27017
    protocol  = "tcp"

    security_groups = [aws_security_group.ssh.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg_egress_cidr_block
  }
  lifecycle {
    ignore_changes = [ingress]
  }

  tags = {
    Name             = "tf-${var.name}-docdb-${var.aws_account_env}-sg"
    EnvType          = var.aws-account-env
    Provisioner      = "terraform"
  }
}
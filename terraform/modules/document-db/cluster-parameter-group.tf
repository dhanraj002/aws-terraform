locals {
  cluster_parameter_group_name = "tf-${var.name}-${var.aws-account-env}-documentdb-cluster"
}

resource "aws_docdb_cluster_parameter_group" "default" {
  count       = var.enabled ? 1 : 0
  name        = local.cluster_parameter_group_name
  description = "docdb cluster parameter group"
  family      = var.cluster_family
  parameter {
    name  = "audit_logs"
    value = "enabled"
  }
  parameter {
    name  = "profiler"
    value = "enabled"
  }

  tags = {
    Name             = "tf-${var.name}-${var.aws-account-env}-parametergroup"
    EnvType          = var.aws-account-env 
    Provisioner      = "terraform"
  }
}
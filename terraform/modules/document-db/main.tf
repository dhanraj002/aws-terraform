resource "aws_docdb_cluster" "document_db_cluster" {
  count                           = var.enabled ? 1 : 0
  cluster_identifier              = "docdb-${var.aws-account-env}env-${var.docdb_name}"
  master_username                 = var.master_username
  master_password                 = "changeme"
  backup_retention_period         = var.retention_period
  preferred_backup_window         = var.preferred_backup_window
  preferred_maintenance_window    = var.preferred_maintenance_window
  final_snapshot_identifier       = var.final_snapshot_identifier
  skip_final_snapshot             = var.skip_final_snapshot
  deletion_protection             = var.deletion_protection
  apply_immediately               = var.apply_immediately
  storage_encrypted               = var.storage_encrypted
  kms_key_id                      = var.kms_key_id
  port                            = var.db_port
  vpc_security_group_ids          = var.vpc_docdb_security_group_ids
  db_subnet_group_name            = var.vpc_docdb_subnet_group_name
  db_cluster_parameter_group_name = local.cluster_parameter_group_name
  engine                          = var.engine
  engine_version                  = var.engine_version
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [master_password]
  }
  tags = {
    Name             = "docdb-${var.aws-account-env}env-${var.docdb_name}"
    EnvType          = var.aws-account-env 
    Provisioner      = "terraform"
  }
}

resource "aws_docdb_cluster_instance" "document_db_instance" {
  count                      = var.enabled ? var.cluster_size : 0
  identifier                 = "tf-docdb-${var.aws-account-env}env-${var.docdb_name}-${count.index}"
  cluster_identifier         = join("", aws_docdb_cluster.document_db_cluster.*.id)
  apply_immediately          = var.apply_immediately
  instance_class             = var.instance_class
  engine                     = var.engine
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  tags = {
    Name             = "${var.name}-${var.aws-account-env}-docdb-instance"
    EnvType          = var.aws-account-env
    Provisioner      = "terraform"
  }
}

locals {
  alarm_name_prefix = "tf-${var.name}-${var.aws-account-env}-docdb"
}

resource "aws_cloudwatch_metric_alarm" "cpu-high" {
  alarm_name          = "${local.alarm_name_prefix}-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/DocDB"
  period              = "600"
  statistic           = "Average"
  threshold           = "60"
  alarm_description   = "This metric monitors aurora cluster for high CPU utilization"

  alarm_actions = var.notify_cloudwatch_sns

  dimensions = {
    DBClusterIdentifier = aws_docdb_cluster.document_db_cluster[count.index].cluster_identifier
  }
  count = 1
}
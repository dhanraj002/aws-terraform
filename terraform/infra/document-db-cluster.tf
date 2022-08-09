module "document-db" {
  source                          = "../modules/document-db"
  name                            = var.name
  aws-account-env                 = var.aws_account_env
  enabled                         = var.docdb_enabled
  master_username                 = var.docdb_master_username
  cluster_size                    = var.docdb_cluster_size
  final_snapshot_identifier       = var.docdb_final_snapshot_identifier
  skip_final_snapshot             = var.docdb_skip_final_snapshot
  deletion_protection             = var.docdb_deletion_protection
  apply_immediately               = var.docdb_apply_immediately
  storage_encrypted               = var.docdb_storage_encrypted
  snapshot_identifier             = var.snapshot_identifier
  vpc_docdb_security_group_ids    = [aws_security_group.document-db.id]
  vpc_docdb_subnet_group_name     = module.vpc.private_app_subnets_name
  engine                          = var.docdb_engine
  engine_version                  = var.docdb_engine_version
  enabled_cloudwatch_logs_exports = var.docdb_enabled_cloudwatch_logs_exports
  kms_key_id                      = aws_kms_key.doc-db-kms.arn
  db_port                         = var.docdb_db_port
  retention_period                = var.docdb_backup_retention_period //1 2 3 
  instance_class                  = var.docdb_instance_class
  auto_minor_version_upgrade      = var.docdb_auto_minor_version_upgrade
  preferred_backup_window         = var.docdb_preferred_backup_window
  preferred_maintenance_window    = var.docdb_preferred_maintenance_window
  notify_cloudwatch_sns           = [aws_sns_topic.docdb_sns_topic.arn]
}
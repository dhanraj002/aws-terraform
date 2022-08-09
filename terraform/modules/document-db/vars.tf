variable "vpc_docdb_security_group_ids" {
  description = "The ID of the security group that should be used for the document db cluster instances"
  type        = list(string)
}
variable "name" {
  default = "cloudtech"
}

variable "aws-account-env" {
  description = "account environment"
  type        = string
}

variable "enabled" {
  type        = bool
  description = "Do you want to create Docdb"
  default     = true
}

variable "cluster_size" {
  type        = number
  default     = 1
  description = "Number of DB instances to create in the cluster"
}

variable "snapshot_identifier" {
  type        = string
  default     = ""
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
}

variable "vpc_docdb_subnet_group_name" {
  description = "The name of the VPC's Docdb subnet group."
  default     = ""
}

variable "db_port" {
  type        = number
  default     = 27017
  description = "DocumentDB port"
}

variable "master_username" {
  type        = string
  description = "(Required unless a snapshot_identifier is provided) Username for the master DB user"
}

variable "retention_period" {
  type        = number
  default     = 5
  description = "Number of days to retain backups for"
}

variable "preferred_backup_window" {
  type        = string
  default     = "04:00-06:00"
  description = "Daily time range during which the backups happen"
}

variable "preferred_maintenance_window" {
  type        = string
  default     = "Sat:06:00-Sat:07:00"
  description = "The window to perform maintenance in. Syntax: `ddd:hh24:mi-ddd:hh24:mi`."
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made."
  default     = null
}

variable "cluster_family" {
  type        = string
  default     = "docdb4.0"
  description = "The family of the DocumentDB cluster parameter group. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-parameter-group-create.html"
}

variable "engine" {
  type        = string
  default     = "docdb"
  description = "The name of the database engine to be used for this DB cluster. Defaults to `docdb`. Valid values: `docdb`"
}

variable "engine_version" {
  type        = string
  default     = "4.0.0"
  description = "The version number of the database engine to use"
}

variable "storage_encrypted" {
  type        = bool
  description = "Specifies whether the DB cluster is encrypted"
  default     = true
}

variable "kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true`"
  default     = ""
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  default     = true
}

variable "deletion_protection" {
  type        = bool
  description = "A value that indicates whether the DB cluster has deletion protection enabled"
  default     = true
}

variable "apply_immediately" {
  type        = bool
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window"
  default     = true
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Specifies whether any minor engine upgrades will be applied automatically to the DB instance during the maintenance window or not"
  default     = true
}

variable "instance_class" {
  type        = string
  default     = "db.t3.medium"
  description = "The instance class to use. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to cloudwatch. The following log types are supported: `audit`, `error`, `general`, `slowquery`"
  default     = []
}

variable "cluster_dns_name" {
  type        = string
  description = "Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `master.var.name`"
  default     = ""
}

variable "reader_dns_name" {
  type        = string
  description = "Name of the reader endpoint CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `replicas.var.name`"
  default     = ""
}
variable "db_cluster_parameter_group_name" {
  type        = string
  description = "A cluster parameter group to associate with the cluster."
  default     = ""
}
variable "docdb_name" {
  default = "cloudtechplatform"
}
variable "notify_cloudwatch_sns" {
  description = "List of SNS topic ARNs for cloudwatch to notifications"
  type        = list(string)
}
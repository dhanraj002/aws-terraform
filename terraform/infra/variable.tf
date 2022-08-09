variable "name" {
  default = ""
}

variable "aws_account_env" {
  default = "dev"
}
variable "aws-account-env" {
  description = "account environment"
  default     = "dev"
}
variable "aws_region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  description = "CIDR network for main managed VPC"
  default     = "10.87.0.0/16"
}

variable "vpc_subnets" {
  description = "Subnet definitions for main managed VPC"
  type        = list(string)

  default = []
}

variable "vpc_private_app_subnets" {
  description = "Private subnet definitions for Application servers in main managed VPC"
  type        = list(string)

  default = []
}

variable "vpc_azs" {
  description = "Subnet definitions for main managed VPC"
  type        = list(string)

  default = [
    "us-east-2a",
    "us-east-2b",
    "us-east-2c",
  ]
}
variable "sg_egress_cidr_block" {
  default = []
}
variable "ig_destination_cidr_block" {
  default = "0.0.0.0/0"
}
variable "nat_destination_cidr_block" {
  default = "0.0.0.0/0"
}

variable "cluster_version" {
  default = "1.22"
}

variable "eks_name" {
  default = "yp"
}
variable "fargate_app_name" {
  default = "cloudtech"
}
variable "instance_types" {
  default = []
}
variable "eks_node_min_size" {
  description = "Minimum number of instances/nodes"
  type        = number
  default     = 0
}

variable "eks_node_max_size" {
  description = "Maximum number of instances/nodes"
  type        = number
  default     = 2
}

variable "eks_desired_size" {
  description = "Desired number of instances/nodes"
  type        = number
  default     = 1
}
variable "eksnode_group_app_name" {
  default = "cloudtech"
}
variable "vpc_private_docdb_subnets" {
  description = "Private subnet definitions for Database servers in main managed VPC"
  type        = list(string)
  default     = []
}
variable "cidr_whitelist" {
  description = "Whitelist for direct network access to services"
  type        = list(string)

  default = ["0.0.0.0/0"]
}
# variable "vpc_private_docdb_subnets" {
#   description = "Private subnet definitions for Database servers in main managed VPC"
#   type        = list(string)
#   default = []
# }
variable "docdb_enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to cloudwatch. The following log types are supported: `audit`, `error`, `general`, `slowquery`"
  default     = []
}
variable "kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true`"
  default     = ""
}
variable "docdb_final_snapshot_identifier" {
  type        = string
  description = "The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made."
  default     = null
}
variable "docdb_storage_encrypted" {
  type        = bool
  description = "Specifies whether the DB cluster is encrypted"
  default     = true
}
variable "snapshot_identifier" {
  type        = string
  default     = ""
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
}
variable "docdb_backup_retention_period" {
  type        = number
  default     = 5
  description = "Number of days to retain backups for"
}
variable "docdb_instance_class" {
  type        = string
  default     = "db.t3.medium"
  description = "The instance class to use. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
}
variable "bastion_ami" {

}
variable "bastion_instance_type" {

}
variable "bastion_key_name" {

}
variable "docdb_cluster_size" {
  type        = number
  default     = 1
  description = "Number of DB instances to create in the cluster"
}
variable "docdb_enabled" {
  type        = bool
  description = "Do you want to create Docdb"
  default     = true
}
variable "docdb_master_username" {
  type        = string
  default     = "devadmin"
  description = "(Required unless a snapshot_identifier is provided) Username for the master DB user"
}
variable "docdb_preferred_backup_window" {
  type        = string
  default     = "04:00-06:00"
  description = "Daily time range during which the backups happen"
}
variable "docdb_preferred_maintenance_window" {
  type        = string
  default     = "Sat:06:00-Sat:07:00"
  description = "The window to perform maintenance in. Syntax: `ddd:hh24:mi-ddd:hh24:mi`."
}
variable "docdb_skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  default     = true
}
variable "docdb_deletion_protection" {
  type        = bool
  description = "A value that indicates whether the DB cluster has deletion protection enabled"
  default     = true
}
variable "docdb_apply_immediately" {
  type        = bool
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window"
  default     = true
}
variable "docdb_db_port" {
  type        = number
  default     = 27017
  description = "DocumentDB port"
}
variable "docdb_engine" {
  type        = string
  default     = "docdb"
  description = "The name of the database engine to be used for this DB cluster. Defaults to `docdb`. Valid values: `docdb`"
}
variable "docdb_engine_version" {
  type        = string
  default     = "4.0.0"
  description = "The version number of the database engine to use"
}
variable "docdb_auto_minor_version_upgrade" {
  type        = bool
  description = "Specifies whether any minor engine upgrades will be applied automatically to the DB instance during the maintenance window or not"
  default     = true
}
variable "cw_resourcename" {
  type = string
}
variable "docDBInstance" {
  type = list(any)
}
variable "name" {
  default = "cloudtech"
}
variable "eksnode_group_app_name" {
  default = "cloudtech"
}

variable "aws-account-env" {
  description = "account environment"
  default     = "dev"
}

variable "eks_cluster_id" {
  default = ""
}

variable "eks_managed_node_group_arn" {
  default = ""
}

variable "private_app_subnets" {
  description = "A list of subnets inside the VPC."
  default     = []
}

variable "instance_types" {
  default = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `{ Deployed = \"xxxx\" }`"
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
variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate"
  type        = list(string)
  default     = []
}
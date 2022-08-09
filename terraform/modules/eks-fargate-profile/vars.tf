variable "fargate_app_name" {
  default = "cloudtech"
  type        = string
}

variable "name" {
  default = ""
  type        = string
}

variable "aws-account-env" {
  description = "account environment"
  type        = string
}

variable "eks_cluster_id" {
  default = ""
}

variable "eks_fargate_profile_role_arn" {
  default = ""
}

variable "private_app_subnets" {
  description = "A list of subnets inside the VPC."
  default     = []
}

variable "namespace" {
  default = []
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}
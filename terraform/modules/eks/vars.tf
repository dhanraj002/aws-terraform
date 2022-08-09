variable "eks_name" {
  default = "ct"
}
variable "eks_role_arn" {
  default = ""
}

variable "aws-account-env" {
  description = "account environment"
  type        = string
}

variable "cluster_version" {
  default = "1.21"
}

variable "cluster_enabled_log_types" {
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "private_app_subnets" {
  description = "A list of subnets inside the VPC."
  default     = []
}

variable "cluster_endpoint_private_access" {
  type    = bool
  default = false
}

variable "cluster_endpoint_public_access" {
  type    = bool
  default = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "policy_attachement" {
  default = []
}
variable "vpc_subnets" {
  description = "Subnet definitions for main managed VPC"
  type        = list(string)
  default     = []

}
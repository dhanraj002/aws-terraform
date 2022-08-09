variable "aws-account-env" {
  description = "account environment"
}
variable "aws-region" {
  description = "The region where the applications are deployed"
  type        = string
}
variable "cluster_roles" {
  description = "List of roles for the cluster (will always READER and WRITER)."
  type        = list(string)
  default     = ["WRITER", "READER"]
}
variable "DBInstance" {
  type        = list(string)
}
variable "resourcename" {
  type = string
  default = "DocumentDB"
}

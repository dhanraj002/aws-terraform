variable "name" {
  default = "cloudtech"
  type        = string
}
variable "aws-account-env" {
  description = "account environment"
  type        = string
}
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default = "t4g.micro"
}
variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}
variable "security_groups" {
  description = "List of SG IDs to use on the instances."
  type        = list(string)
}
variable "key_name" {
  description = "Key name of the Key Pair to use for the instance"
  type        = string
}
variable "user_data" {
  description = "Cloud-init script passed to the launch configuration"
  type        = string
  default     = "# Default script"
}
variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}
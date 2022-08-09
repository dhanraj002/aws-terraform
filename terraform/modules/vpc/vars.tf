variable "name" {
  description = "Name for the VPC"
  default     = "main"
}

variable "cidr" {
  description = "CIDR Formatted address for the VPC"
  default     = "172.17.0.0/17"
}

variable "enable_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  default     = true
}

variable "enable_dns" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "A boolean flag specifying whether or not to map public ips for the public subnet. Only change this if we start explicitly asking for public IPs in autoscaling launch configurations for things that belong in the public subnet."
  default     = true
}

variable "azs" {
  description = "A list of Availability zones in the region"
  default     = []
}

variable "private_app_subnets" {
  description = "A list of private subnets inside the VPC."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "A list of subnets inside the VPC."
  default     = []
}

variable "aws-account-env" {
  description = "account environment"
  default     = "dev"
}
variable "sg_egress_cidr_block" {
  default = []
}
variable "eks_name" {
  default = ""
}

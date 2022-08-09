variable "name" {
  description = "Name for the VPC"
  default     = "main"
}

variable "aws-account-env" {
  description = "account environment"
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "internet_gateway_id" {
  description = "ID of the Internet gateway (if any)"
  default     = ""
}

variable "nat_gateway_ids" {
  description = "IDs of the NAT gateways (if any)"
  type        = list(string)
  default     = []
}

variable "create_internet_gateway_route" {
  description = "Create internet gateway route?"
  type        = bool
  default     = false
}

variable "subnets" {
  description = "A list of subnets inside the VPC."
  default     = []
}
variable "ig_destination_cidr_block" {
  default = "0.0.0.0/0"
}
variable "nat_destination_cidr_block" {
  default = "0.0.0.0/0"
}

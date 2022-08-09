## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group) | resource |
| [aws_docdb_subnet_group.private_docdb_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_subnet_group) | resource |
| [aws_eip.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_subnet.private_app_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-account-env"></a> [aws-account-env](#input\_aws-account-env) | account environment | `string` | `"dev"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | A list of Availability zones in the region | `list` | `[]` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR Formatted address for the VPC | `string` | `"172.17.0.0/17"` | no |
| <a name="input_eks_name"></a> [eks\_name](#input\_eks\_name) | n/a | `string` | `""` | no |
| <a name="input_enable_dns"></a> [enable\_dns](#input\_enable\_dns) | A boolean flag to enable/disable DNS support in the VPC. | `bool` | `true` | no |
| <a name="input_enable_hostnames"></a> [enable\_hostnames](#input\_enable\_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC. | `bool` | `true` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | A boolean flag specifying whether or not to map public ips for the public subnet. Only change this if we start explicitly asking for public IPs in autoscaling launch configurations for things that belong in the public subnet. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the VPC | `string` | `"main"` | no |
| <a name="input_private_app_subnets"></a> [private\_app\_subnets](#input\_private\_app\_subnets) | A list of private subnets inside the VPC. | `list(string)` | `[]` | no |
| <a name="input_sg_egress_cidr_block"></a> [sg\_egress\_cidr\_block](#input\_sg\_egress\_cidr\_block) | n/a | `list` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnets inside the VPC. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_available_azs"></a> [available\_azs](#output\_available\_azs) | n/a |
| <a name="output_azs"></a> [azs](#output\_azs) | n/a |
| <a name="output_cidr"></a> [cidr](#output\_cidr) | n/a |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | n/a |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | n/a |
| <a name="output_nat_gateway_ids"></a> [nat\_gateway\_ids](#output\_nat\_gateway\_ids) | n/a |
| <a name="output_nat_gateway_public_ip_cidrs"></a> [nat\_gateway\_public\_ip\_cidrs](#output\_nat\_gateway\_public\_ip\_cidrs) | n/a |
| <a name="output_nat_gateway_public_ips"></a> [nat\_gateway\_public\_ips](#output\_nat\_gateway\_public\_ips) | n/a |
| <a name="output_private_app_subnets"></a> [private\_app\_subnets](#output\_private\_app\_subnets) | n/a |
| <a name="output_private_app_subnets_azs"></a> [private\_app\_subnets\_azs](#output\_private\_app\_subnets\_azs) | n/a |
| <a name="output_private_app_subnets_count"></a> [private\_app\_subnets\_count](#output\_private\_app\_subnets\_count) | n/a |
| <a name="output_private_app_subnets_name"></a> [private\_app\_subnets\_name](#output\_private\_app\_subnets\_name) | n/a |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_subnets_count"></a> [subnets\_count](#output\_subnets\_count) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |

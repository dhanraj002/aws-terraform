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
| [aws_route.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.private_nat_gateway_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-account-env"></a> [aws-account-env](#input\_aws-account-env) | account environment | `any` | n/a | yes |
| <a name="input_create_internet_gateway_route"></a> [create\_internet\_gateway\_route](#input\_create\_internet\_gateway\_route) | Create internet gateway route? | `bool` | `false` | no |
| <a name="input_ig_destination_cidr_block"></a> [ig\_destination\_cidr\_block](#input\_ig\_destination\_cidr\_block) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_internet_gateway_id"></a> [internet\_gateway\_id](#input\_internet\_gateway\_id) | ID of the Internet gateway (if any) | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the VPC | `string` | `"main"` | no |
| <a name="input_nat_destination_cidr_block"></a> [nat\_destination\_cidr\_block](#input\_nat\_destination\_cidr\_block) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | IDs of the NAT gateways (if any) | `list(string)` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnets inside the VPC. | `list` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route_tables"></a> [route\_tables](#output\_route\_tables) | n/a |

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
| [aws_eks_node_group.eks_node_group_core_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_launch_template.eks_node_group_launchTemplate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-account-env"></a> [aws-account-env](#input\_aws-account-env) | account environment | `string` | `"dev"` | no |
| <a name="input_eks_cluster_id"></a> [eks\_cluster\_id](#input\_eks\_cluster\_id) | n/a | `string` | `""` | no |
| <a name="input_eks_desired_size"></a> [eks\_desired\_size](#input\_eks\_desired\_size) | Desired number of instances/nodes | `number` | `1` | no |
| <a name="input_eks_managed_node_group_arn"></a> [eks\_managed\_node\_group\_arn](#input\_eks\_managed\_node\_group\_arn) | n/a | `string` | `""` | no |
| <a name="input_eks_node_max_size"></a> [eks\_node\_max\_size](#input\_eks\_node\_max\_size) | Maximum number of instances/nodes | `number` | `2` | no |
| <a name="input_eks_node_min_size"></a> [eks\_node\_min\_size](#input\_eks\_node\_min\_size) | Minimum number of instances/nodes | `number` | `0` | no |
| <a name="input_eksnode_group_app_name"></a> [eksnode\_group\_app\_name](#input\_eksnode\_group\_app\_name) | n/a | `string` | `"cloudtech"` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | n/a | `list` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"cloudtech"` | no |
| <a name="input_private_app_subnets"></a> [private\_app\_subnets](#input\_private\_app\_subnets) | A list of subnets inside the VPC. | `list` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{ Deployed = "xxxx" }` | `map(string)` | `{}` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | A list of security group IDs to associate | `list(string)` | `[]` | no |

## Outputs

No outputs.

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
| [aws_eks_fargate_profile.app_fargate_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_fargate_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-account-env"></a> [aws-account-env](#input\_aws-account-env) | account environment | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | n/a | yes |
| <a name="input_eks_cluster_id"></a> [eks\_cluster\_id](#input\_eks\_cluster\_id) | n/a | `string` | `""` | no |
| <a name="input_eks_fargate_profile_role_arn"></a> [eks\_fargate\_profile\_role\_arn](#input\_eks\_fargate\_profile\_role\_arn) | n/a | `string` | `""` | no |
| <a name="input_fargate_app_name"></a> [fargate\_app\_name](#input\_fargate\_app\_name) | n/a | `string` | `"cloudtech"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `""` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `list` | `[]` | no |
| <a name="input_private_app_subnets"></a> [private\_app\_subnets](#input\_private\_app\_subnets) | A list of subnets inside the VPC. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_fargate_profile_arn"></a> [eks\_fargate\_profile\_arn](#output\_eks\_fargate\_profile\_arn) | Amazon Resource Name (ARN) of the EKS Fargate Profile |
| <a name="output_eks_fargate_profile_id"></a> [eks\_fargate\_profile\_id](#output\_eks\_fargate\_profile\_id) | EKS Cluster name and EKS Fargate Profile name separated by a colon |
| <a name="output_eks_fargate_profile_status"></a> [eks\_fargate\_profile\_status](#output\_eks\_fargate\_profile\_status) | Status of the EKS Fargate Profile |

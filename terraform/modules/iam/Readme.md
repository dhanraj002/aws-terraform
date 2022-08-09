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
| [aws_iam_role.eks_nodes_group_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.main_eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.main_fargate-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSServicePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSVPCResourceController_fg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.amazonEKSVPCResourceController1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.main_eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.main_fargate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-account-env"></a> [aws-account-env](#input\_aws-account-env) | account environment | `string` | `"dev"` | no |
| <a name="input_eks_name"></a> [eks\_name](#input\_eks\_name) | n/a | `string` | `"ct"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_fargate_profile_role_arn"></a> [eks\_fargate\_profile\_role\_arn](#output\_eks\_fargate\_profile\_role\_arn) | n/a |
| <a name="output_eks_fargate_profile_role_name"></a> [eks\_fargate\_profile\_role\_name](#output\_eks\_fargate\_profile\_role\_name) | n/a |
| <a name="output_eks_managed_node_group_role_arn"></a> [eks\_managed\_node\_group\_role\_arn](#output\_eks\_managed\_node\_group\_role\_arn) | n/a |
| <a name="output_eks_managed_node_group_role_name"></a> [eks\_managed\_node\_group\_role\_name](#output\_eks\_managed\_node\_group\_role\_name) | n/a |
| <a name="output_eks_role_arn"></a> [eks\_role\_arn](#output\_eks\_role\_arn) | n/a |
| <a name="output_eks_role_name"></a> [eks\_role\_name](#output\_eks\_role\_name) | n/a |

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
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | ID of AMI to use for the instance | `string` | n/a | yes |
| <a name="input_aws-account-env"></a> [aws-account-env](#input\_aws-account-env) | account environment | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance to start | `string` | `"t4g.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key name of the Key Pair to use for the instance | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"cloudtech"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of SG IDs to use on the instances. | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The VPC Subnet ID to launch in | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Cloud-init script passed to the launch configuration | `string` | `"# Default script"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the instance |
| <a name="output_bastion_instance_public_dns"></a> [bastion\_instance\_public\_dns](#output\_bastion\_instance\_public\_dns) | The public IP address assigned to the instance. |
| <a name="output_bastion_instance_public_ip"></a> [bastion\_instance\_public\_ip](#output\_bastion\_instance\_public\_ip) | The public DNS name assigned to the instance. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the instance |

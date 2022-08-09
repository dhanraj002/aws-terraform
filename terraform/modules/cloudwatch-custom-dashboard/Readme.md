## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_dashboard.custom_dashboard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [template_file.cloudwatch_dashboard_definition](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.cloudwatch_metric_definition](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_DBInstance"></a> [DBInstance](#input\_DBInstance) | n/a | `list(string)` | n/a | yes |
| <a name="input_aws-account-env"></a> [aws-account-env](#input\_aws-account-env) | account environment | `any` | n/a | yes |
| <a name="input_aws-region"></a> [aws-region](#input\_aws-region) | The region where the applications are deployed | `string` | n/a | yes |
| <a name="input_cluster_roles"></a> [cluster\_roles](#input\_cluster\_roles) | List of roles for the cluster (will always READER and WRITER). | `list(string)` | <pre>[<br>  "WRITER",<br>  "READER"<br>]</pre> | no |
| <a name="input_resourcename"></a> [resourcename](#input\_resourcename) | n/a | `string` | `"DocumentDB"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_docdb_cw_dashboard_arn"></a> [docdb\_cw\_dashboard\_arn](#output\_docdb\_cw\_dashboard\_arn) | n/a |

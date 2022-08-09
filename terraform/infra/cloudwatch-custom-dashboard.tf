module "docdb-dashboard" {
  source = "../modules/cloudwatch-custom-dashboard"
  aws-region = var.aws_region
  DBInstance = var.docDBInstance
  resourcename = var.cw_resourcename
  aws-account-env = var.aws_account_env
}
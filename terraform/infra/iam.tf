module "iam" {
  source          = "../modules/iam"
  eks_name        = var.eks_name
  aws-account-env = var.aws_account_env
}

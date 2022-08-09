module "eks" {
  source              = "../modules/eks"
  eks_name            = var.eks_name
  aws-account-env     = var.aws_account_env
  eks_role_arn        = module.iam.eks_role_arn
  cluster_version     = var.cluster_version
  private_app_subnets = module.vpc.private_app_subnets
  vpc_subnets         = module.vpc.subnets
}
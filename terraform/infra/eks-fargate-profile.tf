module "eks_fargate" {
  source                       = "../modules/eks-fargate-profile"
  fargate_app_name             = var.fargate_app_name
  name                         = var.name
  aws-account-env              = var.aws_account_env
  eks_fargate_profile_role_arn = module.iam.eks_fargate_profile_role_arn
  private_app_subnets          = module.vpc.private_app_subnets
  eks_cluster_id               = module.eks.cluster_id
  cluster_name                 = module.eks.cluster_id
}
module "eks_manaed_node_group" {
  source                     = "../modules/eks-managed-node-group"
  eksnode_group_app_name     = var.eksnode_group_app_name
  name                       = var.name
  aws-account-env            = var.aws_account_env
  eks_managed_node_group_arn = module.iam.eks_managed_node_group_role_arn
  private_app_subnets        = module.vpc.private_app_subnets
  eks_cluster_id             = module.eks.cluster_id
  instance_types             = var.instance_types
  eks_desired_size           = var.eks_desired_size
  eks_node_max_size          = var.eks_node_max_size
  eks_node_min_size          = var.eks_node_min_size
  vpc_security_group_ids     = [module.eks.cluster_security_group_id]
}

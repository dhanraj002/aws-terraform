resource "aws_eks_cluster" "main" {
  name                      = "tf-${var.eks_name}-${var.aws-account-env}-eks-cluster"
  role_arn                  = var.eks_role_arn
  version                   = var.cluster_version
  enabled_cluster_log_types = var.cluster_enabled_log_types

  vpc_config {
    subnet_ids              = concat(var.vpc_subnets, var.private_app_subnets)
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }
  tags = {
    Name             = "tf-${var.eks_name}-${var.aws-account-env}-eks-cluster"
    EnvType          = var.aws-account-env
    Provisioner      = "terraform"
  }
  timeouts {
    delete = "30m"
  }
}
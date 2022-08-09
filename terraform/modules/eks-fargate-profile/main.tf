resource "aws_eks_fargate_profile" "app_fargate_profile" {
  cluster_name           = var.eks_cluster_id
  fargate_profile_name   = "tf-${var.fargate_app_name}-${var.aws-account-env}-eks_fargate_profile"
  pod_execution_role_arn = var.eks_fargate_profile_role_arn
  subnet_ids             = var.private_app_subnets
  tags = {
    Name             = "tf-${var.fargate_app_name}-${var.aws-account-env}-eks_fargate_profile"
    EnvType          = var.aws-account-env 
    Provisioner      = "terraform"
    Namespace        = "${var.name}-${var.aws-account-env}-namespace"
  }

  selector {
    namespace = "tf-${var.fargate_app_name}-${var.aws-account-env}-namespace"
  }
}
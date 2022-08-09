resource "aws_eks_node_group" "eks_node_group_core_dns" {
  cluster_name    = var.eks_cluster_id
  node_group_name = "tf-${var.eksnode_group_app_name}-${var.aws-account-env}-eks_managed_node_group"
  node_role_arn   = var.eks_managed_node_group_arn
  subnet_ids      = var.private_app_subnets

  scaling_config {
    desired_size = var.eks_desired_size
    max_size     = var.eks_node_max_size
    min_size     = var.eks_node_min_size
  }
  launch_template {
    name    = aws_launch_template.eks_node_group_launchTemplate.name
    version = aws_launch_template.eks_node_group_launchTemplate.latest_version
  }
  tags = {
    Name             = "tf-${var.eksnode_group_app_name}-${var.aws-account-env}-eks_managed_node_group"
    EnvType          = var.aws-account-env 
    Provisioner      = "terraform"
  }
}
resource "aws_launch_template" "eks_node_group_launchTemplate" {
  name = "tf-${var.eksnode_group_app_name}-${var.aws-account-env}-launch_template"
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type = "t3.medium"
  block_device_mappings {
    device_name = "/dev/xvda"   
    ebs {
      volume_size = 20
      volume_type = "gp2"
      encrypted = true
    }
  }
}
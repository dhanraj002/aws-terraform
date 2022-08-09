output "eks_role_arn" {
  value = aws_iam_role.main_eks.arn
}
output "eks_role_name" {
  value = aws_iam_role.main_eks.name
}

output "eks_fargate_profile_role_arn" {
  value = aws_iam_role.main_fargate-role.arn
}

output "eks_fargate_profile_role_name" {
  value = aws_iam_role.main_fargate-role.name
}

output "eks_managed_node_group_role_arn" {
  value = aws_iam_role.eks_nodes_group_role.arn
}

output "eks_managed_node_group_role_name" {
  value = aws_iam_role.main_fargate-role.name
}
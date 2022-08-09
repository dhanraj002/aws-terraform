output "eks_fargate_profile_id" {
  description = "EKS Cluster name and EKS Fargate Profile name separated by a colon"
  value       = aws_eks_fargate_profile.app_fargate_profile.id
}

output "eks_fargate_profile_arn" {
  description = "Amazon Resource Name (ARN) of the EKS Fargate Profile"
  value       = aws_eks_fargate_profile.app_fargate_profile.arn
}

output "eks_fargate_profile_status" {
  description = "Status of the EKS Fargate Profile"
  value       = aws_eks_fargate_profile.app_fargate_profile.status
}
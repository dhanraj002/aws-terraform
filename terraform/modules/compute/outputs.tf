output "id" {
  description = "The ID of the instance"
  value       = aws_instance.bastion.id
}
output "arn" {
  description = "The ARN of the instance"
  value       = aws_instance.bastion.arn
}
output "bastion_instance_public_ip" {
  description = "The public DNS name assigned to the instance."
  value = aws_instance.bastion.public_ip
}
output "bastion_instance_public_dns" {
  description = "The public IP address assigned to the instance."
  value = aws_instance.bastion.public_dns
}

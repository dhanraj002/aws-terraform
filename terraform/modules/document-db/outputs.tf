output "arn" {
  value       = join("", aws_docdb_cluster.document_db_cluster.*.arn)
  description = "Amazon Resource Name (ARN) of the cluster"
}
output "endpoint" {
  value       = join("", aws_docdb_cluster.document_db_cluster.*.endpoint)
  description = "Endpoint of the DocumentDB cluster"
}
output "reader_endpoint" {
  value       = join("", aws_docdb_cluster.document_db_cluster.*.reader_endpoint)
  description = "A read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas"
}
output "cw_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.cpu-high.*.arn
  description = "The ARN of the CloudWatch Metric Alarm"
}

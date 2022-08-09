resource "aws_sns_topic" "docdb_sns_topic" {
  name  = "DocDB${var.aws_account_env}EnvCPUUtilization"
  policy = jsonencode({
    Statement = [{
      Action    = "sns:Publish"
      Effect    = "Allow"
      Principal = {
        Service: [
            "cloudwatch.amazonaws.com"
        ]
      }
      Resource  = "*"
    }]
    Version = "2012-10-17"
  })
  display_name      = "DocumentDB High CPU"

  tags = {
    EnvType            = var.aws-account-env 
    Provisioner        = "terraform"
  }
}
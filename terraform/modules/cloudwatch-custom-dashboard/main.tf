
data "template_file" "cloudwatch_metric_definition" {
  template = <<JSON
  {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/DocDB",
            "CPUUtilization",
            "DBInstanceIdentifier",
            "$${DBInstance}"
          ],
          [ "...", "$${DBInstance_reader}" ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "$${region}",
        "title": "CPUUtilization: Average"
      }
    },
    {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/DocDB",
            "DatabaseConnections",
            "DBInstanceIdentifier",
            "$${DBInstance}"
          ],
          [ "...", "$${DBInstance_reader}" ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "$${region}",
        "view": "timeSeries",
        "title": "DatabaseConnections"
      }
    },
    {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/DocDB",
            "ReadIOPS",
            "DBInstanceIdentifier",
            "$${DBInstance}"
          ],
          [ "...", "$${DBInstance_reader}" ]
        ],
        "region": "$${region}",
        "view": "timeSeries",
        "title": "ReadIOPS"
      }
    },
    {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/DocDB",
            "WriteIOPS",
            "DBInstanceIdentifier",
            "$${DBInstance}"
          ],
          [ "...", "$${DBInstance_reader}" ]
        ],
        "region": "$${region}",
        "view": "timeSeries",
        "title": "WriteIOPS"
      }
    },
    {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/DocDB",
            "BufferCacheHitRatio",
            "DBInstanceIdentifier",
            "$${DBInstance}"
          ],
          [ "...", "$${DBInstance_reader}" ]
        ],
        "region": "$${region}",
        "view": "timeSeries",
        "title": "BufferCacheHitRatio"
      }
    },
    {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/DocDB",
            "WriteLatency",
            "DBInstanceIdentifier",
            "$${DBInstance}"
          ],
          [ "...", "$${DBInstance_reader}" ]
        ],
        "region": "$${region}",
        "view": "timeSeries",
        "title": "WriteLatency"
      }
    }
    JSON
    

    vars = {
      region = var.aws-region
      DBInstance = var.DBInstance[count.index]
      DBInstance_reader = var.aws-account-env == "production" ? var.DBInstance[count.index +1] : var.DBInstance[count.index]
    }
    count = 1
}
data "template_file" "cloudwatch_dashboard_definition" {
  template = <<JSON
  {
    "widgets": [
      $${widget}
    ]
  }
  JSON


  vars = {
    widget = join(
      ",\n",
      data.template_file.cloudwatch_metric_definition.*.rendered,
    )
  }
}

resource "aws_cloudwatch_dashboard" "custom_dashboard" {
  dashboard_name = "tf-${var.resourcename}-${var.aws-account-env}-env"
  dashboard_body = data.template_file.cloudwatch_dashboard_definition.rendered
}

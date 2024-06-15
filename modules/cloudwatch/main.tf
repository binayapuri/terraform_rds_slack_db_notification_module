# Create alarms for CPU Utilization, Read IOPS, and Write IOPS for each RDS instance
resource "aws_cloudwatch_metric_alarm" "high_cpu_rds" {
  for_each            = toset(local.rds_instances)
  # alarm_name          = "${each.value}-high-cpu-usage"
  alarm_name = "${each.value} high-cpu-usage ${var.environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = "50"

  alarm_description = "This metric monitors RDS CPU utilization"
  dimensions = {
    DBInstanceIdentifier = each.value
  }

  alarm_actions = [var.alarm_actions]
  ok_actions    = [var.ok_actions]

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "high_read_iops" {
  for_each            = toset(local.rds_instances)
  # alarm_name          = "${each.value}-high-read-iops"
  alarm_name = "${each.value} high-read-iops ${var.environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ReadIOPS"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = "50"  # Set your threshold for read IOPS

  alarm_description = "This metric monitors RDS Read IOPS"
  dimensions = {
    DBInstanceIdentifier = each.value
  }

  alarm_actions = [var.alarm_actions]
  ok_actions    = [var.ok_actions]

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "high_write_iops" {
  for_each            = toset(local.rds_instances)
  # alarm_name          = "${each.value}-high-write-iops"
  alarm_name = "${each.value} high-write-iops ${var.environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "WriteIOPS"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = "50"  # Set your threshold for write IOPS

  alarm_description = "This metric monitors RDS Write IOPS"
  dimensions = {
    DBInstanceIdentifier = each.value
  }

  alarm_actions = [var.alarm_actions]
  ok_actions    = [var.ok_actions]

  tags = var.tags
}

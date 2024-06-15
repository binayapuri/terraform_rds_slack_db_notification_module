# Create an SNS Topic
resource "aws_sns_topic" "alarm_topic" {
  name = "${var.project_name}_${var.environment}_alarm_topic"
}

# Subscribe Lambda to SNS Topic
resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.alarm_topic.arn
}

resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = "lambda"
  endpoint  = var.endpoint
}
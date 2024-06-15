# Create IAM Role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "SlackNotification_${var.project_name}_${var.environment}_iam"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# Attach AWS managed policies to the IAM role
resource "aws_iam_role_policy_attachment" "lambda_ssm" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  role       = aws_iam_role.lambda_exec.name
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_exec.name
}

#  Create Lambda Function
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "lambda"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "send_to_slack" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name = "${var.project_name}_${var.environment}_function"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "function.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      SLACK_WEBHOOK_URL = var.slack_webhook_url
    }
  }

  tags = var.tags
}
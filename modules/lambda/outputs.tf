output "function_name" {
    value = aws_lambda_function.send_to_slack.function_name
}

output "endpoint" {
    value = aws_lambda_function.send_to_slack.arn
}
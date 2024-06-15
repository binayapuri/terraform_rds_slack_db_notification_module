output "alarm_actions" {
    value = aws_sns_topic.alarm_topic.arn
}

output "ok_actions"{
    value = aws_sns_topic.alarm_topic.arn
}




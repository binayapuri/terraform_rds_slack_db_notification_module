variable "project_name" {
  type = string
}
variable "environment" {}
# variable "aws_region" {
#     type    = list(string)
#     # default = ["us-east-1", "eu-north-1"]  # Add the desired regions here
# }
variable "aws_region"{}
variable "terraform" {}
variable "slack_webhook_url" {}
variable "rds_instances" {
  type = list(string)
}


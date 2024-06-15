variable "project_name" {}
variable "environment" {}
variable "aws_region" {}
variable "terraform" {}
variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
}
variable "alarm_actions"{}
variable "ok_actions"{}
variable "rds_instances"{}




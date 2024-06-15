module "cloudwatch" {
  source       = "./modules/cloudwatch"
  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region
  terraform    = var.terraform
  tags         = local.default_tags
  #variables of SNS
  alarm_actions = module.sns.alarm_actions
  ok_actions    = module.sns.ok_actions
  rds_instances = var.rds_instances
}

module "lambda" {
  source       = "./modules/lambda"
  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region
  terraform    = var.terraform
  tags         = local.default_tags
  slack_webhook_url = var.slack_webhook_url
}

module "sns" {
  source       = "./modules/sns"
  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region
  terraform    = var.terraform
  tags         = local.default_tags
  #functions
  function_name = module.lambda.function_name
  endpoint      = module.lambda.endpoint

}
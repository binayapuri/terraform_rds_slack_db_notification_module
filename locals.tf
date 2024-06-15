locals {
  default_tags = {
    Project     = var.project_name
    Environment = var.environment
    terraform   = var.terraform
  }
}
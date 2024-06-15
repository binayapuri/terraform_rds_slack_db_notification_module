# Process to apply this command
terraform init
terraform plan -var-file=environments/dev.tfvars
terraform apply -var-file=environments/dev.tfvars
terraform destroy -var-file=environments/dev.tfvars

# terraform_rds_slack_db_notification_module

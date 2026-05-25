aws_region = "us-east-1"

project = {
  name        = "devops-ia"
  environment = "production"
}

backend = {
  bucket_name                        = "devops-ia-production-terraform-state-074994084847"
  noncurrent_version_expiration_days = 90
}

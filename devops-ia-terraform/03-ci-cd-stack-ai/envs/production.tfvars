aws_region = "us-east-1"

project = {
  name        = "devops-ia"
  environment = "production"
}

github_actions = {
  oidc_provider_url = "https://token.actions.githubusercontent.com"
  github_org        = "SalesFX"
  github_repo       = "aws-devops-platform"
  allowed_branches  = ["main"]
  role_name         = "devops-ia-production-github-actions"
  ecr_repository_arns = [
    "arn:aws:ecr:us-east-1:074994084847:repository/devops-ia/production/backend",
    "arn:aws:ecr:us-east-1:074994084847:repository/devops-ia/production/frontend"
  ]
}

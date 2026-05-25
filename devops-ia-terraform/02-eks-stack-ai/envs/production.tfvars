aws_region = "us-east-1"

project = {
  name        = "devops-ia"
  environment = "production"
}

ecr = {
  repository_names     = ["backend", "frontend"]
  image_tag_mutability = "MUTABLE"
  scan_on_push         = true
  force_delete         = true
}

eks = {
  cluster_name    = "devops-ia-production"
  cluster_version = "1.31"
  node_group = {
    name           = "devops-ia-production"
    instance_types = ["t3.micro"]
    capacity_type  = "ON_DEMAND"
    ami_type       = "AL2_x86_64"
    desired_size   = 2
    min_size       = 1
    max_size       = 4
    disk_size      = 20
  }
  cluster_log_types       = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  endpoint_private_access = true
  endpoint_public_access  = true
}

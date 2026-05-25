---
name: AWS Account and Infrastructure Details
description: AWS account ID, region, ECR repos, EKS cluster name, S3 backend bucket
type: project
---

Core infrastructure facts discovered from existing Terraform code:

- **AWS Account ID**: `654654554686`
- **Region**: `us-east-1`
- **EKS Cluster**: `devops-ia-production` (v1.31, 2x t3.medium ON_DEMAND)
- **ECR Repos**: `devops-ia/production/backend`, `devops-ia/production/frontend`
- **S3 Backend**: `devops-ia-production-terraform-state`
- **Terraform**: >= 1.10.0, provider hashicorp/aws ~> 6.0 (latest: 6.46.0)
- **VPC CIDR**: `10.0.0.0/24`, 2 AZs (us-east-1a, us-east-1b)
- **GitHub Repo**: `SalesFX/aws-devops-platform`

**Why:** These are foundational facts needed for all architecture decisions.

**How to apply:** Reference these values in ADRs and validate they haven't changed before citing them.

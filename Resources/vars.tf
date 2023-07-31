variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "ecr_repo_name" {
  description = "ECR repository name"
  type        = string
}

variable "codeartifact_domain" {
  description = "CodeArtifact domain name"
  type        = string
}

variable "codeartifact_domain_owner" {
  description = "CodeArtifact domain owner"
  type        = string
}

variable "codeartifact_repo_name" {
  description = "CodeArtifact repository name"
  type        = string
}

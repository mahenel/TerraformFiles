provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "sample-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls   = true
  block_public_policy = true
}


resource "aws_ecr_repository" "repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_codeartifact_repository" "maven_repo" {
  domain         = var.codeartifact_domain
  domain_owner   = var.codeartifact_domain_owner
  repository     = var.codeartifact_repo_name

  external_connections {
    external_connection_name = "public:maven-central"
  }
}

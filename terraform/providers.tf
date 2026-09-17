provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.tags
  }
}

terraform {
  backend "s3" {
    bucket       = "tfstate8"
    key          = "autogang/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

terraform {
  required_version = ">= 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

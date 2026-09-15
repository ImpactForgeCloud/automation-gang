provider "aws" {
  region = var.aws_region
  default_tags = {
    tags = local.tags
  }
}

terraform {
  backend "s3" {
    bucket       = "tfstate8"
    key          = "${var.project_name}/terraform.tfstate"
    region       = var.aws_region
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

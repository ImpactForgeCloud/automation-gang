terraform {
  backend "s3" {
    bucket       = "tfstate8"
    key          = "autogang/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}


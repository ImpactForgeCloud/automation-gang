variable "project_name" {
  type        = string
  description = "Short name used in resource names and tags"
  default     = "autogang"
}

variable "tags" {
  type = map(string)
  default = {
    Project   = "autogang"
    ManagedBy = "terraform"
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1" # ACM and CloudFront need us-east-1 for a custom cert
}





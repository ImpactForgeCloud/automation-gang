variable "project_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "bucket_name" {
  type = string
}

variable "bucket_arn" {
  type = string
}

variable "bucket_domain_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "origin_id" {
  type    = string
  default = "site_bucket"
}

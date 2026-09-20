variable "project_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "bucket_domain_name" {
  type = string
}

variable "origin_id" {
  type    = string
  default = "site_bucket"
}

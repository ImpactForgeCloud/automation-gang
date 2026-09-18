output "site_bucket_name" {
  value = module.site_bucket.bucket_name
}

output "cloudfront_domain_name" {
  value = module.cloudfront.domain_name
}

output "cloudfront_distro_id" {
  value = module.cloudfront.distro_id
}


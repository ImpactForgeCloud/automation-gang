output "site_bucket_name" {
  value = module.site_bucket.bucket_id
}

output "cloudfront_domain_name" {
  value = module.cloudfront.domain_name
}

output "cloudfront_distribution_id" {
  value = module.cloudfront.distribution_id
}


// these are the old outputs
output "site_bucket_name" {
  value = aws_s3_bucket.site.id
}

output "site_bucket_arn" {
  value = aws_s3_bucket.site.arn
}

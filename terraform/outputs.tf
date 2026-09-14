output "site_bucket_name" {
  value = aws_s3_bucket.site.id
}

output "site_bucket_arn" {
  value = aws_s3_bucket.site.arn
}

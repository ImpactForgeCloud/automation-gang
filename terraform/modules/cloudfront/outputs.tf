output "domain_name" {
  value = aws_cloudfront_distribution.site.domain_name
}

output "distro_id" {
  value = aws_cloudfront_distribution.site.id
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.site.hosted_zone_id
}

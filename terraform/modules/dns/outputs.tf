output "zone_id" {
  value = aws_route53_zone.site.zone_id
}

output "name_servers" {
  value = aws_route53_zone.site.name_servers
}

output "certificate_arn" {
  value = aws_acm_certificate_validation.site.certificate_arn
}


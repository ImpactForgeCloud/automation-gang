module "site_bucket" {
  source       = "./modules/site_bucket"
  project_name = var.project_name
  tags         = var.tags
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  project_name       = var.project_name
  tags               = var.tags
  bucket_name        = module.site_bucket.bucket_name
  bucket_arn         = module.site_bucket.bucket_arn
  bucket_domain_name = module.site_bucket.bucket_domain_name
  domain_name        = var.domain_name
  certificate_arn    = module.dns.certificate_arn
}

module "dns" {
  source      = "./modules/dns"
  tags        = var.tags
  domain_name = var.domain_name
}

resource "aws_route53_record" "apex" {
  zone_id = module.dns.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = module.cloudfront.domain_name
    zone_id                = module.cloudfront.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = module.dns.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"
  alias {
    name                   = module.cloudfront.domain_name
    zone_id                = module.cloudfront.hosted_zone_id
    evaluate_target_health = false
  }
}




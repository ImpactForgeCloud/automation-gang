module "site_bucket" {
  source       = "./modules/site_bucket"
  project_name = var.project_name
  tags         = var.tags
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  project_name       = var.project_name
  tags               = var.tags
  bucket_domain_name = module.site_bucket.bucket_domain_name
}


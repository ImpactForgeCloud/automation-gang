locals {
  origin_id = "s3_bucket"
}

data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}

resource "aws_cloudfront_distribution" "site" {
  enabled             = true
  is_ipv6_enabled     = false
  comment             = "${var.project_name} site"
  default_root_object = "index.html"
  http_version        = "http2and3"
  price_class         = "PriceClass_100"
  aliases             = [] // add the domain when ACM exists
  tags                = var.tags


  origin {
    domain_name = var.bucket_domain_name
    origin_id   = local.origin_id
    // origin_access_control_id = aws_cloudfront_origin_access_control.site.id  # next
  }

  default_cache_behavior {
    target_origin_id       = local.origin_id
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    cache_policy_id        = data.aws_cloudfront_cache_policy.caching_optimized.id
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  custom_error_response {
    error_code         = 403
    response_code      = 404
    response_page_path = "/index.html"
  }

  custom_error_response {
    error_code         = 404
    response_code      = 404
    response_page_path = "/index.html"
  }
}







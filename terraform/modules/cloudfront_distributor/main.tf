resource "aws_cloudfront_distribution" "html_distribution" {
  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_id                = var.s3_origin_id

    origin_access_control_id = var.origin_access_control_id

    
  }
  enabled             = var.distribution_enabled
  is_ipv6_enabled     = true
  default_root_object = var.default_root_object

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  default_cache_behavior {
    target_origin_id       = var.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    compress = true
  }
}
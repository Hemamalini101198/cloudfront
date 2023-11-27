resource "aws_cloudfront_distribution" "cf_s3_distribution" {
  origin {
    domain_name = var.domain_name
    origin_id   = var.origin_id
  }
enabled             = true
  is_ipv6_enabled     = true
  #comment             = "test-cloud-front"
  #aliases = ["${var.admin_domain_name}"]  

default_cache_behavior {
   # viewer_protocol_policy = "redirect-to-https"
    
#  cache_policy_id              = "Managed-CachingOptimized"
#  origin_request_policy_id     = "Managed-AllViewer"
   allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]          
    target_origin_id = var.target_origin_id
forwarded_values {
      query_string = false
cookies {
        forward = "none"
      }
    }
viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
 /* 
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "test-bucket98548"
forwarded_values {
      query_string = false
cookies {
        forward = "none"
      }
    }

viewer_protocol_policy = "redirect-to-https"
   # min_ttl                = 0
   # default_ttl            = 3600
   # max_ttl                = 86400
  # cache_policy_id              = aws_cloudfront_cache_policy.managed_caching_optimized.id
  # origin_request_policy_id     = aws_cloudfront_origin_request_policy.managed_cors_s3_origin.id   
  }
  */

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      #locations        = ["BY", "CD", "CU", "IR", "IQ", "LY", "NZ", "KP", "SD", "SS", "YE", "ZW", "RU", "SY", "UA"]
    }
  }

  tags = {
    Environment = "${var.env}"
  }

  viewer_certificate {
   cloudfront_default_certificate = true
   #cloudfront_default_certificate = true
   #acm_certificate_arn      = "${var.cert_cloud}"
   #ssl_support_method       = "sni-only"
   #minimum_protocol_version = "TLSv1.2_2021"
 
}
}

data "aws_cloudfront_origin_request_policy" "this" {
  name = "Managed-CORS-S3Origin"
}

data "aws_cloudfront_cache_policy" "this" {
  name = "Managed-CachingOptimized"
}

data "aws_cloudfront_response_headers_policy" "this"{
  name = "CorsFullAccess"
}

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
    
  cache_policy_id              = data.aws_cloudfront_cache_policy.this.id
  origin_request_policy_id     = data.aws_cloudfront_origin_request_policy.this.id
  response_headers_policy_id = data.aws_cloudfront_response_headers_policy.this.id
   allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
   cached_methods   = ["GET", "HEAD"]          
   target_origin_id = var.target_origin_id

viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

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

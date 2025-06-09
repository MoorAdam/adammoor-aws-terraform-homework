module "s3_bucket" {
  source      = "../s3"
  bucket_name = "file-bucket-123643387264"
}

resource "aws_s3_object" "html_file" {
  bucket = module.s3_bucket.bucket
  key    = var.html_file_key
  source = var.html_file_source
  content_type = "text/html"
  depends_on = [ module.s3_bucket ]
}

resource "aws_cloudfront_origin_access_control" "s3_oac" {
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
  name                              = "s3-origin-access-control"
}

data "aws_caller_identity" "current" {}


resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = module.s3_bucket.bucket

  policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": {
          "Sid": "AllowCloudFrontServicePrincipalReadOnly",
          "Effect": "Allow",
          "Principal": "*",
          "Action": "s3:GetObject",
          "Resource": "${module.s3_bucket.arn}/*",
          "Condition": {
              "StringEquals": {
                  "AWS:SourceArn": "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${module.cloudfront_distribution.distribution_id}"
              }
          }
      }
  })
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = module.s3_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

module "cloudfront_distribution" {
  source = "../cloudfront_distributor"

  bucket_regional_domain_name = module.s3_bucket.s3_bucket_regional_domain_name
  origin_access_control_id    = aws_cloudfront_origin_access_control.s3_oac.id
  s3_origin_id                = module.s3_bucket.bucket
  distribution_enabled        = var.distribution_enabled
}
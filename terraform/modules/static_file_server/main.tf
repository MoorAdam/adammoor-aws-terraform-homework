resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  force_destroy = var.force_delete_files_on_destroy

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_object" "html_file" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  key    = var.html_file_key
  source = var.html_file_source
  content_type = "text/html"
  depends_on = [ aws_s3_bucket.s3_bucket ]
}

resource "aws_cloudfront_origin_access_control" "s3_oac" {
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
  name                              = "s3-origin-access-control-5757645656745"
}

data "aws_caller_identity" "current" {}


resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": {
          "Sid": "AllowCloudFrontServicePrincipalReadOnly",
          "Effect": "Allow",
          "Principal": "*",
          "Action": "s3:GetObject",
          "Resource": "${aws_s3_bucket.s3_bucket.arn}/*",
          "Condition": {
              "StringEquals": {
                  "AWS:SourceArn": "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${module.cloudfront_distribution.distribution_id}"
              }
          }
      }
  })
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

module "cloudfront_distribution" {
  source = "../cloudfront_distributor"

  bucket_regional_domain_name = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
  origin_access_control_id    = aws_cloudfront_origin_access_control.s3_oac.id
  s3_origin_id                = aws_s3_bucket.s3_bucket.bucket
  distribution_enabled        = var.distribution_enabled
}
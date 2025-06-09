output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "bucket" {
  value = aws_s3_bucket.s3_bucket.bucket
}

output "arn" {
  value = aws_s3_bucket.s3_bucket.arn
}
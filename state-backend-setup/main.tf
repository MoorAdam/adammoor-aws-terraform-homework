terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.95"
    }
  }
}


resource "aws_s3_bucket" "state_bucket" {
  bucket = var.state_bucket_name
  force_destroy = var.force_delete_files_on_destroy
  tags = {
    Name = var.state_bucket_name
  }
  
}

resource "aws_s3_bucket_public_access_block" "state_bucket_pab" {
  bucket = aws_s3_bucket.state_bucket.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "state_bucket_policy" {
  bucket = aws_s3_bucket.state_bucket.id
  depends_on = [ aws_s3_bucket_public_access_block.state_bucket_pab ]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "arn:aws:iam::239762172680:role/terragrunt-execution-role"
        Action = ["s3:ListBucket"]
        Resource = "${aws_s3_bucket.state_bucket.arn}"
      },
      {
        Effect = "Allow"
        Principal = "arn:aws:iam::239762172680:role/terragrunt-execution-role"
        Action = ["s3:GetObject", "s3:PutObject"]
        Resource = "${aws_s3_bucket.state_bucket.arn}/*"
      }
    ]
  })
}
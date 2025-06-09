terraform {
  

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


resource "aws_s3_bucket" "state_bucket" {
  bucket = var.state_bucket_name

  tags = {
    Name = var.state_bucket_name
  }
  
}
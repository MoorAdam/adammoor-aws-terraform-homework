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

  force_destroy = var.force_delete_files_on_destroy

  tags = {
    Name = var.state_bucket_name
  }
  
}
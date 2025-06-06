variable "operation-iam-role" {
  default = "terragrunt-execution-role"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_name" {
  default = "main-vpc"
}

variable "vpc_cidr_block" {
  default = "192.168.0.0/16"
}
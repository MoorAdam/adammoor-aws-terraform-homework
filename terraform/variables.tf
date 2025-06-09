variable "state_backend_s3" {
  default = "state-bucket-245473465"
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



variable "public_subnet_name" {
  default = "public-subnet"
}
variable "public_subnet_cidr_block" {
  default = "192.168.1.0/24"
}
variable "public_subnet_availability_zone" {
  default = "eu-central-1a"
}



variable "private_subnet_name" {
  default = "private-subnet"
}
variable "private_subnet_cidr_block" {
  default = "192.168.2.0/24"
}
variable "private_subnet_availability_zone" {
  default = "eu-central-1b"
}



variable "instance_type" {
  default = "t2.micro"
}
variable "ami_id" {
  default = "ami-014dd8ec7f09293e6"
}
variable "instance_name" {
  default = "public-instance"
}



variable "bucket_name" {
  default = "html-supplier-bucket"
} 



variable "html_file_key" {
  default = "index.html"
}

variable "html_file_source" {
  default = "../html/index.html"
}



variable "force_delete_files_on_destroy" {
  default = false
}
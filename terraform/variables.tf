variable "aws_region" {
  default = "eu-west-2"
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
  default = "eu-west-2a"
}



variable "private_subnet_name" {
  default = "private-subnet"
}
variable "private_subnet_cidr_block" {
  default = "192.168.2.0/24"
}
variable "private_subnet_availability_zone" {
  default = "eu-west-2a"
}



variable "instance_type" {
  default = "t2.micro"
}
variable "ami_id" {
  default = "ami-01c0ed0b087735750"
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
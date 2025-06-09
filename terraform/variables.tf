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

variable "private_subnet_name" {
  default = "private-subnet"
}
variable "private_subnet_cidr_block" {
  default = "192.168.2.0/24"
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
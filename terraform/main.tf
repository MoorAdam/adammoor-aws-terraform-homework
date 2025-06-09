terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
}

module "public_subnet" {
  source = "./modules/subnet"

  vpc_id                   = module.vpc.vpc_id
  subnet_name              = var.public_subnet_name
  subnet_cidr              = var.public_subnet_cidr_block
  subnet_availability_zone = var.public_subnet_availability_zone
  map_public_ip_on_launch  = true
}

module "private_subnet" {
  source = "./modules/subnet"

  vpc_id                   = module.vpc.vpc_id
  subnet_name              = var.private_subnet_name
  subnet_cidr              = var.private_subnet_cidr_block
  subnet_availability_zone = var.private_subnet_availability_zone
  map_public_ip_on_launch  = false
}

module "ec2_instance" {
  source = "./modules/ec2"

  instance_type = var.instance_type
  ami_id        = var.ami_id
  subnet_id     = module.public_subnet.subnet_id
  instance_name = var.instance_name
}

module "static_file_server" {
  source = "./modules/static_file_server"

  html_file_key          = var.html_file_key
  html_file_source       = var.html_file_source
}
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

  vpc_name = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
}

module "public_subnet" {
  source = "./modules/subnet"

  vpc_id = module.vpc.vpc_id
  subnet_name = var.public_subnet_name
  subnet_cidr = var.public_subnet_cidr_block
  subnet_availability_zone = true
}

module "private_subnet" {
  source = "./modules/subnet"

  vpc_id = module.vpc.vpc_id
  subnet_name = var.private_subnet_name
  subnet_cidr = var.private_subnet_cidr_block
  subnet_availability_zone = false
}
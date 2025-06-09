terraform {
  required_version = ">= 1.0.0"


  backend "s3" {
    bucket         = "state-bucket-245473465"
    key            = "terraform.tfstate"
    use_lockfile = true
    region         = "eu-centrnal-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id

    cidr_block = var.public_subnet_cidr_block
    availability_zone = var.public_subnet_availability_zone

    map_public_ip_on_launch = true
    tags = {
        Name = "private_subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc.id

    cidr_block = var.private_subnet_cidr_block
    availability_zone = var.private_subnet_availability_zone

    map_public_ip_on_launch = false
    tags = {
        Name = "private_subnet"
    }
}

resource "aws_instance" "instance" {
    ami           = var.ami_id
    instance_type = var.instance_type
    subnet_id     = aws_subnet.public_subnet.id
    
    tags = {
        Name = var.instance_name
    }
}

module "static_file_server" {
  source = "./modules/static_file_server"

  html_file_key          = var.html_file_key
  html_file_source       = var.html_file_source
  force_delete_files_on_destroy = var.force_delete_files_on_destroy
}
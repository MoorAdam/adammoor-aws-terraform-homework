resource "aws_subnet" "pulic_subnet" {
    vpc_id = var.vpc_id

    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_subnet_availability_zone
}

resource "aws_subnet" "private_subnet" {
    vpc_id = var.vpc_id

    cidr_block = var.private_subnet_cidr
    availability_zone = var.private_subnet_availability_zone
}
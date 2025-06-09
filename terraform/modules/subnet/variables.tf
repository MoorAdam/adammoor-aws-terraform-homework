variable "vpc_id" {
  type        = string
}


variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}



variable "public_subnet_name" {
  type = string
  default = "public_subnet"
}

variable "private_subnet_name" {
  type = string
  default = "private_subnet"
}



variable "public_subnet_availability_zone" {
  type = string
}

variable "private_subnet_availability_zone" {
  type = string
}
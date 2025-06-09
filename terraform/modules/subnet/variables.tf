variable "vpc_id" {
  type        = string
}

variable "subnet_cidr" {
  type = string
}

variable "subnet_name" {
  type = string
  default = "subnet"
}

variable "subnet_availability_zone" {
  type = string
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}
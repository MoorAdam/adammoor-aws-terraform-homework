variable "bucket_regional_domain_name" {
  type = string
}

variable "origin_access_control_id" {
  type = string
}

variable "s3_origin_id" {
  type = string
}

variable "distribution_enabled" {
  type    = bool
  default = true
}

variable "default_root_object" {
  type    = string
  default = "index.html"
}
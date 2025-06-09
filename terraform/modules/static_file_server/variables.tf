variable "html_file_key" {
  type        = string
}

variable "html_file_source" {
  type        = string
}

variable "distribution_enabled" {
  type        = bool
  default     = true
}

variable "bucket_name" {
  type        = string
  default = "file-server-bucket-7564756734965756"
}
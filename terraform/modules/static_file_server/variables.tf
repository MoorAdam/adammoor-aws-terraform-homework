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
  default = "file-server-bucket-756475674564363456345634965756"
}

variable "force_delete_files_on_destroy" {
  type        = bool
  default     = false
}
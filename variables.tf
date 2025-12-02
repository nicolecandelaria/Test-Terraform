variable "bucket_name" {
  type        = string
  description = "Name of the storage bucket"
}

variable "region" {
  type    = string
  default = "US"
}

variable "enable_versioning" {
  type    = bool
  default = true
}
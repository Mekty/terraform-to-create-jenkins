variable "aws_region" {
  default = "us-east-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type = string
  default = "mbadady-12-03-2023"
}

variable "acl" {
  type = string
  default = "private"
}

variable "s3_bucket_versioning" {
  type = string
  default = "Enabled"
}
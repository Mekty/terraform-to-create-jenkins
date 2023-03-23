resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_acl" "acl_example" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = var.s3_bucket_versioning
  }
}
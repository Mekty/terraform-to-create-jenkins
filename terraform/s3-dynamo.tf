module "s3" {
  source = "../modules/amazon-s3-dynamodb/amazon-module-s3"
  s3_bucket_name = var.s3_bucket_name
}
module "aws_dynamodb" {
  source        = "../modules/amazon-s3-dynamodb/amazon-module-dynamobd"
  db_table_name = var.db_table_name
  billing_mode  = var.billing_mode
  hash_key      = var.hash_key
  attr_name     = var.attr_name
  attr_type     = var.attr_type
}
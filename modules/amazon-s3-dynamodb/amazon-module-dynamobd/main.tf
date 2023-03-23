resource "aws_dynamodb_table" "dynamodb_table" {
  name           = var.db_table_name
  read_capacity  = 5
  write_capacity = 2
  hash_key       = var.hash_key

  attribute {
    name = var.attr_name
    type = var.attr_type
  }
  
  tags = {
    Name = "My DynamoDB Table"
  }
}
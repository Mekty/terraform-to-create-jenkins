variable "aws_region" {
  default = "us-east-1"
}

variable "db_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "backend-dynamo"
}

variable "billing_mode" {
  description = "DynamoDB billing mode"
  type        = string
  default     = "PAY_PER_REQUEST" # or "PROVISIONED"
}

variable "hash_key" {
  description = "DynamoDB hash key"
  type        = string
  default     = "LockID"
}

variable "attr_type" {
  description = "DynamoDB attribute type"
  type        = string
  default     = "S"
}

variable "attr_name" {
  description = "DynamoDB attribute name"
  type        = string
  default     = "LockID"
}
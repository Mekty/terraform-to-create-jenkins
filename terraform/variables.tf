variable "aws_region" {
  default = "us-east-1"
}


variable "s3_bucket_name" {
  description = "S3 bucket name"
  type = string
  default = "mekty-19-03-2023"
}

variable "acl" {
  type = string
  default = "private"
}

variable "s3_bucket_versioning" {
  type = string
  default = "Enabled"
}

# Dynamodb

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

variable "attr_name" {
  description = "DynamoDB attribute name"
  type        = string
  default     = "LockID"
}

variable "attr_type" {
  description = "DynamoDB attribute type"
  type        = string
  default     = "S"
}

variable "ami" {
  default = "ami-005f9685cb30f234b"
}

variable "instance_type" {
  default = "t2.medium"
}

# variable "inbound_ports" {
#   type = number
#   default = 22
# }
variable "inbound_ports" {
  type = list(number)
  default = [8080, 22]
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet" {
  type = map
  default = {
    subnet-a = {
      az = "us-east-1a"
      cidr = "10.0.2.0/24"
    }
    subnet-b = {
      az = "us-east-1b"
      cidr = "10.0.3.0/24"
    }
  }
}